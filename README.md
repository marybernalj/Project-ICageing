# Intrinsic Capacity Estimation and Ageing Study

# Overview
This repository contains the dataset, the SPSS syntax files and the results of the experiments conducted as part of the paper "Estimating Intrinsic Capacity and Unveiling Ageing Trajectories". The data come from the Health and Retirement Study (HRS), which provides valuable longitudinal data on ageing, health and socio-demographic factors. The aim of this study is to quantify intrinsic capacity (IC) and understand how different lifestyle factors influence it over time, particularly through a multidimensional approach guided by the ICOPE guidelines.

# Repository Structure
# 1. Data Folder
* Data set - Long format - All variables except locomotion.sav: This dataset contains all the variables used in the analysis, excluding locomotion. It follows the long format, where each row represents a single individual’s data for a particular time point.
* Data set - Long format - Locomotion.sav: This dataset contains locomotion-related data, which is reported every four years as opposed to biennially like other variables.
# 2. Code Folder
* Syntax 01 - Sensoriality.sps: This SPSS syntax file analyzes the sensory domain of intrinsic capacity, including hearing and vision impairments.
* Syntax 02 - Vitality.sps: This file focuses on the vitality domain, assessing energy balance, nutrition, and mobility.
* Syntax 03 - Psychological Functionality.sps: This file analyzes the psychological well-being domain, including depression and mood indicators.
* Syntax 04 - Cognition.sps: This file focuses on the cognition domain, assessing memory, orientation, and cognitive functions.
* Syntax 05 - Locomotion.sps: This syntax is dedicated to analyzing the domain of locomotion, which is based on physical mobility and physical performance tests such as the SPPB (Short Physical Performance Battery). This domain is separate from the other domains because locomotion is measured by physical measurements that are collected every four years rather than every two years.
# 3. Results Folder
* Results - Mixed Model - All variables except locomotion.spv: This file contains the results of the mixed models for all domains of intrinsic capacity, except locomotion. It analyzes how lifestyle factors influence the progression of IC.
* Results - Mixed Model - Locomotion.spv: This file contains the results of the mixed models specifically for the locomotion domain, considering its distinct reporting frequency.
# How to Use the Files
# Step 1: Load the Datasets
* Start by loading the relevant dataset based on the domain you are analyzing (e.g., the full dataset excluding locomotion or the dataset for locomotion).
* Use SPSS to open the .sav files.
# Step 2: Run the SPSS Syntax Files
* To analyze the sensory domain, run Syntax 01 - Sensoriality.sps.
* For vitality, run Syntax 02 - Vitality.sps.
* For psychological functionality, run Syntax 03 - Psychological Functionality.sps.
* For cognition, run Syntax 04 - Cognition.sps.
* For locomotion, run Syntax 05 - Locomotion.sps (keep in mind that locomotion is reported every four years, so it’s handled separately).
# Step 3: Review the Results
* The results for each domain will be saved in SPV files located in the Results folder.
* Open the relevant SPV file (e.g., Results - Mixed Model - All variables except locomotion.spv or Results - Mixed Model - Locomotion.spv) to view the statistical output, which includes coefficients, p-values, and model diagnostics.

The Locomotion.sav data set is treated separately due to the different frequency with which physical measurements are recorded. While most of the health data in the HRS is collected every two years, the physical activity data is only reported every four years. This distinction is important for accurately modeling and analyzing the progression of intrinsic capacity over time

# Conclusion
This repository contains all the necessary data, codes and results to support the study of intrinsic capacity and its evolution with ageing following the ICOPE framework. You can use the provided SPSS syntax files to perform the analysis for different IC domains and assess how lifestyle and socio-demographic factors influence the ageing trajectory.
