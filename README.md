# Ageing Study. Estimating and Predicting Intrinsic Capacity 

# Overview
This repository contains data, scripts, and results from two complementary studies focused on intrinsic capacity (IC) and ageing trajectories, both based on the Health and Retirement Study (HRS), which provides valuable longitudinal data on ageing, health and socio-demographic factors.:

- **Study 1:** This study focused on computing IC scores based on ICOPE guidelines and analyzing their evolution using longitudinal mixed models in SPSS. The aim of this study is to quantify intrinsic capacity (IC) and understand how different lifestyle factors influence it over time, particularly through a multidimensional approach guided by the ICOPE guidelines.
- **Study 2:** This study introduces machine learning and deep learning models (including LSTM and traditional algorithms like SVM, RF, and MLP) for predicting IC domains using lifestyle sequences and personal attributes.

The goal is to provide a comprehensive understanding of both the estimation and prediction of IC, offering insights into the progression and modifiable determinants of functional ageing.

# Repository Structure
# 1. Data Folder
- `raw/`: Contains raw CSV files and SPSS `.sav` datasets from HRS used in both studies.
- `processed/`: Datasets preprocessed for prediction models (including transformed, encoded, and scaled data).
- `README_data.md`: Description of each dataset, processing pipeline, and versioning.
# 2. Code Folder
#### A. SPSS Syntax Files (Study 1 - Estimation)
* `SPSS Syntax Files (Study 1 - Estimation)/`: 
  - Syntax 01 - Sensoriality.sps: This SPSS syntax file analyzes the sensory domain of intrinsic capacity, including hearing and vision impairments.
  - Syntax 02 - Vitality.sps: This file focuses on the vitality domain, assessing energy balance, nutrition, and mobility.
  - Syntax 03 - Psychological Functionality.sps: This file analyzes the psychological well-being domain, including depression and mood indicators.
  - Syntax 04 - Cognition.sps: This file focuses on the cognition domain, assessing memory, orientation, and cognitive functions.
  - Syntax 05 - Locomotion.sps: This syntax is dedicated to analyzing the domain of locomotion, which is based on physical mobility and physical performance tests such as the SPPB (Short Physical Performance Battery). This domain is separate from the other domains because locomotion is measured by physical measurements that are collected every four years rather than every two years.
#### B. Jupyter Notebooks (Study 2 - Prediction Models)
* `ML-DL Implementations (Study 2 - Prediction Models)/`:
  - `data_preprocessing/`
    - `data_transform_lstm.py`
    - `data_transform_rf_svm_mlp.py`
    - `sequence_generator.py`: Code to generate sequence data for LSTM models.
  - `models/`
    - `lstm_multitask.ipynb`: Multitask LSTM model with optional auxiliary inputs.
    - `lstm_single_task.ipynb`: Single task LSTM model with optional auxiliary inputs.
    - `mlp_multitask.ipynb`: Baseline deep model using dense layers.
    - `svm_multitask.ipynb`: Code to train and evaluate SVM model using `MultiOutputRegressor`.
    - `RF_multitask.ipynb`: Code to train and evaluate Random Forest model using `MultiOutputRegressor`.
# 3. Results Folder
* `mixed_models/`: SPSS `.spv` output files from Study 1.
  - Results - Mixed Model - All variables except locomotion.spv: This file contains the results of the mixed models for all domains of intrinsic capacity, except locomotion. It analyzes how lifestyle factors influence the     progression of IC.
  - Results - Mixed Model - Locomotion.spv: This file contains the results of the mixed models specifically for the locomotion domain, considering its distinct reporting frequency.
* `lime_outputs/`: LIME visual explanations per domain.
* `plots/`: Figures such radar charts used in both papers.
# How to Use the Files
### Study 1 (Estimation - SPSS)
1. Load the Datasets
    - Start by loading the relevant dataset based on the domain you are analyzing (e.g., the full dataset excluding locomotion or the dataset for locomotion).
    - Use SPSS to open the .sav files.
2. Run the SPSS Syntax Files
    * To analyze the sensory domain, run Syntax 01 - Sensoriality.sps.
    * For vitality, run Syntax 02 - Vitality.sps.
    * For psychological functionality, run Syntax 03 - Psychological Functionality.sps.
    * For cognition, run Syntax 04 - Cognition.sps.
    * For locomotion, run Syntax 05 - Locomotion.sps (keep in mind that locomotion is reported every four years, so it’s handled separately).
3. Review the Results
    * The results for each domain will be saved in SPV files located in the Results folder.
    * Open the relevant SPV file (e.g., Results - Mixed Model - All variables except locomotion.spv or Results - Mixed Model - Locomotion.spv) to view the statistical output, which includes coefficients, p-values, and model diagnostics.

The Locomotion.sav data set is treated separately due to the different frequency with which physical measurements are recorded. While most of the health data in the HRS is collected every two years, the physical activity data is only reported every four years. This distinction is important for accurately modeling and analyzing the progression of intrinsic capacity over time

### Study 2 (Prediction - Python)
The CODE/ML-DL Implementations (Study 2 - Prediction Models) directory contains Jupyter notebooks implementing several machine learning and deep learning models for predicting intrinsic capacity domains. Each notebook corresponds to a specific modeling technique.

1. **Set up your environment**
   - Use a Python environment with the required libraries. Recommended: Python ≥ 3.8, with JupyterLab or Google Colab.
   - Required packages include:
     - `pandas`, `numpy`, `scikit-learn`, `tensorflow`, `matplotlib`, `lime`.
  
2. **Prepare the dataset**
   - Ensure the data file `DATOS_OBSERVACION_VAR_NOTNULL2010-2022_TRANSFORM_ENCODED.csv` is placed in the `DATA/` directory.
   - All notebooks automatically reference this preprocessed file.

3. **Select the notebook corresponding to the model**
   - Navigate to the folder:
     `CODE/ML-DL Implementations (Study 2 - Prediction Models)`
   - Available notebooks:

     | Model Type                     | Notebook File                        |
     |--------------------------------|--------------------------------------|
     | LSTM Multitask                 | `LSTM_MULTITASK.ipynb`         |
     | LSTM Single-task               | `LSTM_SINGLE_TASK.ipynb`        |
     | Random Forest (RF)            | `RF_MULTITASK.ipynb`                     |
     | Support Vector Machine (SVM)  | `SVM_MULTITASK.ipynb`                    |
     | Multilayer Perceptron (MLP)   | `MLP_MULTITASK.ipynb`                    |
   

4. **Open and run the notebook**
   - You can use Jupyter Notebook, JupyterLab, or Google Colab.
   - Each notebook:
     - Loads and preprocesses the data.
     - Constructs input sequences.
     - Trains the model.
     - Evaluates MAE and other metrics per IC domain.

5. **Interpret model predictions**
   - Use `SPLIME ANALYSIS.ipynb` to generate local explanations of predictions made by the LSTM model.
   - The `RANDOM FOREST MODEL CHARACTERISTICS.ipynb` notebook also provides global feature importance across domains.

# Conclusion
This repository contains all the necessary data, codes and results to support the study of intrinsic capacity and its evolution with age according to the ICOPE framework. You can use the provided SPSS syntax files to perform the analysis for different IC domains and assess how lifestyle and socio-demographic factors influence the ageing trajectory. The code for machine learning and deep learning models to predict IC trajectories is also included.
