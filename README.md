---
author: Shivani Malik
date: 2025-06-20
output: html_document
title: SKCM Readme
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
    -   **Primary Set**: 15 matching genes → AUC 0.85 (train), 0.83
        (test)
    -   **Third Set**: 12 matching genes → AUC 0.85 (train), 0.86 (test)

------------------------------------------------------------------------

## 📁 Key Files

## TCGA and GEO folder inncludes:

-   `TCGA_SKCM.R`: R script for downloading
-   `preprocessing.py`: Python script to clean the dataset
-   `feature_selection_ML.py`: Applies SVC-L1, and ML models
-   `GEO_download.R`: R script to download the GSE65904 dataset
-   'preprocessing_geo904.py': To clean the data and match with tcga
    biomarker set genes
-   'geo904.py': Used for ML analysis for 15 match genes(primary set)
-   '3rdset_13_geo904.py : Used for ML analysis for 12 match genes
    (third set)

## 📂 Datasets Used

-   **Training and testing **: TCGA-SKCM
-   **Validation on new dataset**: GSE65904
## use the same code for other set of biomarkers##
