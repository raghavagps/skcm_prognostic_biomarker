---
Author: Shivani Malik
Date: 2025-06-20
Title: SKCM README
---

## R Markdown

# 🧬 Identification of Multiple Prognostic Biomarkers sets for Risk stratification in SKCM

This project identifies and validates prognostic biomarker sets in
**skin cutaneous melanoma (SKCM)** using statistical and machine
learning approaches.

------------------------------------------------------------------------

## 🔍 Overview

-   **Data Retrieval**: Gene expression data (473 samples, 60,660 genes)
    was downloaded from TCGA using `TCGAbiolinks` in R.
-   **Normalization**: Data was normalized to TPM.
-   **Statistical Analysis**: Performed correlation analysis, survival
    analysis (Cox, Kaplan-Meier), and LASSO.
-   **Survival Class Creation**: OS time was used to create 4 survival
    classes (0--1, 1--3, 3--5, \>5 years → Class 0,1,2,3).
-   **Feature Selection**: Applied SVC-L1, RFE, SelectKBest, and SFS to
    identify top genes.
-   **Class Balancing**: Used SMOTE to balance the dataset.
-   **Biomarker Sets**: Created 7 biomarker sets (each with 20 genes).
-   **Model Performance**: AUC ranged from **0.84 to 0.91**, and Kappa
    from **0.48 to 0.64** across sets.
-   **Model Training**: Applied many models but best Trained classifiers
    (CatBoost) and evaluated using AUC-ROC.
-   **Validation**: Validated on **GSE65904 (214 samples)** using
    overlapping genes.
    -   **First Set**: 15 matching genes → AUC 0.85 (train), 0.83
        (test)
    -   **Third Set**: 12 matching genes → AUC 0.85 (train), 0.86 (test)

------------------------------------------------------------------------
This repository contains all relevant files and scripts used to identify and validate prognostic biomarkers in SKCM using statistical and machine learning approaches.

---

## 📁 Repository Structure

### 1. `Biomarkers/`
Contains lists of genes identified through feature selection and validated on a new dataset.

- `Primary_biomarker/`
  - `List_1st_set.txt` – First set of 20 genes selected from TCGA using SVC-L1.
  - `List_2nd_set.txt` – Second set of 20 genes selected using alternative feature selection methods.
  - `List_3rd_set.txt` – Third set of 20 genes selected from TCGA.
  - `List_4th_set.txt` – Fourth set of 20 selected biomarker genes.
  - `List_5th_set.txt` – Fifth set of 20 selected biomarker genes.
  - `List_6th_set.txt` – Sixth set of 20 selected biomarker genes.
  - `List_7th_set.txt` – Seventh set of 20 selected biomarker genes.

- `Validated_biomarker/`
  - `List_match_1st.txt` – List of 15 matched genes from the first biomarker set validated on GEO dataset (GSE65904).
  - `List_match_3rd.txt` – List of 12 matched genes from the third biomarker set validated on GEO dataset (GSE65904).


### 2. `Dataset/`
Includes scripts and data access instructions for both primary (TCGA) and validation (GEO) datasets.

#### a. `Primary_data_TCGA/`
- `Script/`
  - `TCGA_SKCM.R` – R script for downloading SKCM expression data using `TCGAbiolinks`.
- `Link/`
  - `Data_link.txt` – Contains links to TCGA data portal and UCSC Xena browser for direct download.

#### b. `Validation_data_GEO/`
- `Script/`
  - `GEO_SKCM.R` – R script for downloading GSE65904 dataset.
- `Link/`
  - `Data_link.txt` – Contains GEO accession links.

---

### 3. `Scripts/`
Includes preprocessing, feature selection, and machine learning implementation scripts.

 - `Preprocessing_TCGA.py` – Preprocessing steps: Remove 50% zeroes and low variance gene. 

 - `Feature_selection_ML_TCGA.py` – Feature selection using SVC-L1 on the basis of ranking, ML training and evaluate performance

 - `15_1stset_ML_GEO.py` – ML analysis on 15 matched genes from the primary biomarker set.


  - `12_3rdset_ML_GEO.py` – ML analysis on 12 matched genes from the third biomarker set.

## use the same code for other set of biomarkers##

All the GEO and TCGA relevant data files and models could be downloaded from the google drive link: https://drive.google.com/drive/folders/1HIVw_rfpHolB3tAvJTtOZVV0USOANil-.