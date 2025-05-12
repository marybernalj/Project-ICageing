# README - Data Directory

This folder contains all the data resources used across the two main studies of this repository:

1. **Study 1:** Estimation of Intrinsic Capacity (IC) based on ICOPE domains using SPSS mixed models.
2. **Study 2:** Predicting IC domains with a multi-task approach using traditional machine learning and deep learning models, based on sequential lifestyle and health data.

---

## Folder Structure

### `/raw/`

This folder contains unprocessed datasets derived from the Health and Retirement Study (HRS) used in both studies. These include:

### `Data set - Long format - All variables except locomotion.sav`

- Contains the complete panel dataset in long format.
- Includes all ICOPE-derived domains of IC and key lifestyle/sociodemographic variables.
- Excludes the `LOCOMOTION` domain (see next file).

### `Data set - Long format - Locomotion.sav`

- Contains only locomotion-related variables.
- The locomotion domain was collected every 4 years, unlike the other domains that were collected every 2 years.

These two datasets are used together to construct both static and sequential representations of IC and predictors.

---

### `/processed/`

This folder contains data files that have been transformed and adapted for modeling, separated by use case:

- The preprocessed data files contain information on a variety of health-related factors, including physical and cognitive functioning, psychological well-being, and health behaviors. 
- The preprocessed data has been cleaned, transformed, and formatted for use in machine learning models. The data has been cleaned by removing any missing or invalid data points. The data has been transformed by converting categorical variables into numerical variables. The data has been formatted by organizing the data into a consistent format that can be used by machine learning models.
- The preprocessed data files are named according to the year in which the data was collected. For example, the file named "2008.csv" contains data that was collected in 2008.
- The preprocessed data files are available in CSV format.
- The preprocessed data files are the input to the machine learning models that are used to predict health outcomes in older adults.

---

## Variables Overview

Each dataset includes some or all of the following key variables:

### Intrinsic Capacity Domains (Targets)
- `LOCOMOTION`, `SENSORY`, `VITALITY`, `PSYCHOLOGICAL`, `COGNITION`

### Lifestyle Predictors
- `PHYSICAL_ACTIVITY` (categorical, encoded as 4 levels: sedentary, mild, moderate, vigorous)
- `CIGARETTES` (number smoked weekly)
- `DRINK` (alcohol consumption level)
- `CALC_IMC` (Body Mass Index, computed)

### Sociodemographic Variables
- `AGE`
- `SEX` (male/female)
- `ALONE` (living alone or partnered)

### Temporal Structure
All datasets used for prediction maintain temporal consistency across three timepoints per individual (t–2, t–1, t), which are spaced every 4 years in the HRS.

---

## Notes

- All data is pseudonymized and processed following ethical guidelines for secondary analysis of the HRS.
- Any transformations (scaling, encoding, imputation) are applied consistently across all experiments using dedicated scripts in `data_preprocessing`.

---

## Citation

Data were obtained from the Health and Retirement Study (HRS), sponsored by the National Institute on Aging (NIA U01AG009740) and conducted by the University of Michigan.

