setwd("/Users/raghava_lab/Desktop/TCGA_SKCM")
library(readxl)
install.packages("readxl")
install.packages("BiocManager")
BiocManager::install("TCGAbiolinks", type = "source")
install.packages('TCGAbiolinks')
# Install or update BiocManager
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Install TCGAbiolinks from Bioconductor
BiocManager::install("TCGAbiolinks", force=TRUE)

library(TCGAbiolinks)
install.packages("tidyverse")
library(tidyverse)
install.packages("maftools")
# Install or update BiocManager
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Install maftools from Bioconductor
BiocManager::install("maftools")
install.packages('maftools', force = TRUE)


library(maftools)
install.packages('pheatmap')
library(pheatmap)
# Install or update BiocManager
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Force re-installation of SummarizedExperiment from Bioconductor
BiocManager::install("SummarizedExperiment", force = TRUE)
library(SummarizedExperiment)

# Get a list of TCGA projects
gdcprojects <- getGDCprojects()
getProjectSummary('TCGA-SKCM')

# building a query
query_TCGA <- GDCquery(project = 'TCGA-SKCM',
data.category = 'Transcriptome Profiling')
output_query <- getResults(query_TCGA)

#build a query to retrieve gene expression data
query_TCGA_SKCM <- GDCquery(
  project = 'TCGA-SKCM',
  data.category = 'Transcriptome Profiling',
  data.type = 'Gene Expression Quantification',
  experimental.strategy = 'RNA-Seq',
  access = 'open'
)
getResults <- (query_TCGA_SKCM)
# download data - GDCdownload
GDCdownload(query_TCGA_SKCM)
## prepare data
tcga_Skcm_data = GDCprepare(query_TCGA_SKCM,summarizedExperiment=TRUE) 
skcm_matrix <- assay(tcga_Skcm_data,"tpm_unstrand")
# Assuming skcm_matrix is a matrix with Ensembl Gene IDs as row names
# Convert matrix to data frame
skcm_matrix_df <- as.data.frame(skcm_matrix)
# Display the first few rows to check row names
head(rownames(skcm_matrix_df))
# Save as CSV with row names
write.csv(skcm_matrix_df, "skcm_matrix.csv", row.names = TRUE)
# Load the CSV file with row names
loaded_data <- read.csv("skcm_matrix.csv", row.names = 1)
# Load the biomaRt package
library(biomaRt)

# Specify the Ensembl dataset and organism
ensembl_dataset <- "hsapiens_gene_ensembl"  # For Homo sapiens
organism <- "hsapiens"

# Create a biomart object
mart <- useMart(biomart = "ensembl", dataset = ensembl_dataset)

# Get mapping from Ensembl Gene IDs to gene symbols
ensembl_to_symbol <- getBM(attributes = c("ensembl_gene_id", "external_gene_name"), mart = mart)
rlang::last_trace()
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocFileCache::clear_cache()


BiocManager::install("biomaRt")


# Assuming skcm_matrix is a matrix with Ensembl Gene IDs as row names
# Convert matrix to data frame
skcm_matrix_df <- as.data.frame(skcm_matrix)

# Extract Ensembl Gene IDs from row names
ensembl_ids <- rownames(skcm_matrix_df)

# Map Ensembl Gene IDs to gene symbols
gene_symbols <- ensembl_to_symbol[ensembl_to_symbol$ensembl_gene_id %in% ensembl_ids, ]

# Merge gene symbols with skcm_matrix_df based on Ensembl Gene IDs
skcm_matrix_with_symbols <- merge(skcm_matrix_df, gene_symbols, by.x = "Row.names", by.y = "ensembl_gene_id", all.x = TRUE)

# Save the matrix with gene symbols as a CSV file
write.csv(skcm_matrix_with_symbols, "skcm_matrix_with_symbols.csv", row.names = FALSE)



# In R (and other programming languages) you can often
# chain functions to save time and space
colnames(colData(tcga_data))
table(tcga_data@colData$vital_status)
table(tcga_data@colData$tumor_stage)
table(tcga_data@colData$definition)
table(tcga_data@colData$tissue_or_organ_of_origin)
table(tcga_data@colData$gender)
table(tcga_data@colData$race)
dim(assay(tcga_data))
head(assay(tcga_data)[,1:10]) # expression of first 6 genes and first 10 samples
head(rowData(tcga_data)) 
# Save the data as a file, if you need it later, you can just load this file
# instead of having to run the whole pipeline again
saveRDS(object = tcga_data,
        file = "tcga_data.csv",
        compress = FALSE)
tcga_data = readRDS(file = "tcga_data.RDS")
# ensembl id and gene id of the first 6 genes.
# building a query for  clinical
#query_TCGA_Clinical <- GDCquery(project = 'TCGA-SKCM',
                       #data.category = 'Clinical')
#output_query_Clinical <- getResults(query_TCGA_Clinical)

#build a query to retrieve clinical data
#query_TCGA_Clinical_SKCM <- GDCquery(
 # project = 'TCGA-SKCM',
  #data.category = 'Clinical',
  #data.type = 'Clinical Supplement',
  #access = 'open'
#)
#getResults_Clinical <- (query_TCGA_Clinical_SKCM)
#GDCdownload(query_TCGA_Clinical_SKCM)

# prepare data
#tcga_SKCM_data <- GDCprepare (query_TCGA_SKCM, summarizedExperiment = TRUE)                       
