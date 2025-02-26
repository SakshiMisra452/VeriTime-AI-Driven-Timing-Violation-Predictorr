function features = extract_features(rtl_filename)
    % Read the Verilog file
    rtl_code = fileread(rtl_filename);
    
    % Convert code to lowercase for consistent searching
    rtl_code = lower(rtl_code);
    
    % Remove module header (port declarations)
    rtl_code_no_header = regexprep(rtl_code, 'module\s+\w+\s*\([^)]*\);', '');

    % Extract features from the RTL code
    num_AND = count(rtl_code_no_header, ' and ');
    num_OR = count(rtl_code_no_header, ' or ');
    num_XOR = count(rtl_code_no_header, ' xor ');
    num_NAND = count(rtl_code_no_header, ' nand ');
    num_NOR = count(rtl_code_no_header, ' nor ');
    num_FF = count(rtl_code_no_header, 'posedge clk'); % Detect flip-flops by clock edge
    num_assign = count(rtl_code_no_header, 'assign') + count(rtl_code_no_header, '<=') + count(rtl_code_no_header, '='); % Count all assignment types
    num_always = count(rtl_code_no_header, 'always');

    % Ensure the feature vector is always 1x8
    features = [num_AND, num_OR, num_XOR, num_NAND, num_NOR, num_FF, num_assign, num_always];
    
    % Ensure row vector format (1x8)
    features = reshape(features, 1, []);
end
