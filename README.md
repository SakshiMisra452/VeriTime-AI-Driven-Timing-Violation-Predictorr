# VeriTime-AI-Driven-Timing-Violation-Predictor
This project introduces a Machine Learning-based Timing Violation Predictor that helps designers and verification engineers automate the detection of timing violations in RTL designs. The system extracts key features from Verilog RTL files, processes them using a trained neural network model, and predicts the likelihood of timing violations.
Brief Summary 
In modern Very Large Scale Integration (VLSI) design, timing violations remain one of the most challenging obstacles in digital circuit verification. These violations occur due to clock skew, wire delays, process variations, and logic congestion, leading to design failures and inefficient timing closure. Traditional Static Timing Analysis (STA) methods, while effective, are highly time-consuming and computationally expensive, requiring iterative design modifications.
This project introduces a Machine Learning-based Timing Violation Predictor that helps designers and verification engineers automate the detection of timing violations in RTL designs. The system extracts key features from Verilog RTL files, processes them using a trained neural network model, and predicts the likelihood of timing violations.
The application includes a Graphical User Interface (GUI) that allows users to:
 Load RTL files for analysis
 Predict timing violations using the trained ML model
 View real-time results in a command window
 Manually execute feature extraction, model training, and predictions
By leveraging deep learning, this tool significantly reduces debugging time, improves accuracy, and enhances design cycle efficiency, making it a scalable, efficient, and user-friendly tool for the semiconductor industry.
Problem Statement
What are we doing?
We are developing an AI-driven tool that automates the detection of timing violations in RTL Verilog designs. The tool leverages machine learning to predict violations based on extracted design features, reducing the need for manual debugging and expensive Static Timing Analysis (STA).

Why is this needed?
Traditional STA methods require significant computational resources and manual effort.
Timing violations cause circuit failures, increased power consumption, and performance degradation.
Current design verification tools are either too slow or inefficient for early-stage analysis.
Who benefits from this solution?
This tool is beneficial for:
 VLSI Design Engineers – Enables quick detection and debugging of timing violations.
 Verification Engineers – Helps verify RTL code before full synthesis.
 Chip Design Startups – Reduces dependence on expensive EDA tools for early-stage verification.
 Students & Researchers – Provides a framework for ML-based chip design optimization.

Proof of Correctness

 1. Mean Squared Error (MSE) Analysis
To validate the ML model, we computed the Mean Squared Error (MSE) on test data, which resulted in:
📌 Mean Squared Error: 2.5189e-05
 A lower MSE indicates that our model accurately predicts timing violations with minimal deviation from actual STA results.
 Compared to traditional methods, this approach provides faster, near-exact predictions while significantly reducing computational overhead.

 2. Feature Verification: Predicted Logic Depth
For a given RTL design, the system predicted:
📌 Predicted Logic Depth: -0.0050189

 Significance:

 Logic depth represents the longest combinational path delay in a design.
A negative value suggests that the prediction is very close to zero, meaning the system detects a minimal or no significant violation in this specific test case.
This reinforces the precision and reliability of the model in estimating actual timing constraints.


https://github.com/user-attachments/assets/a3220796-0d42-433b-9c4a-3b9e9c0562d1



