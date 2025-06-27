library(GEOquery)
gse <- getGEO("GSE65904", GSEMatrix = TRUE)
geo <- gse[[1]] 
pheno_dff <- as.data.frame(pData(geo))
# Expression matrix
expr_matrix <- exprs(geo) 
hist(expr_matrix[,1], main="Histogram of expression values", xlab="Value")

# Extract expression values
expr_df <- as.data.frame(expr_matrix)
# Flatten all values into a single vector
all_expr_values <- unlist(expr_df)

# Compute statistics
min_val <- min(all_expr_values, na.rm = TRUE)
max_val <- max(all_expr_values, na.rm = TRUE)
mean_val <- mean(all_expr_values, na.rm = TRUE)
std_val <- sd(all_expr_values, na.rm = TRUE)

# Display
cat("Min:", min_val, "\n")
cat("Max:", max_val, "\n")
cat("Mean:", mean_val, "\n")
cat("Standard Deviation:", std_val, "\n")

# Save to CSV
write.csv(expr_df, "/Users/shivanimalik/Documents/TCGA_data/geo/GSE65904/geo_expression_data.csv")
# Save to CSV
write.csv(pheno_dff, "/Users/shivanimalik/Documents/TCGA_data/geo/GSE65904/geo_phenotype_data.csv")
# Extract the featureData table (e.g., gene annotation)
gene_annotation <- geo@featureData@data

# Save as CSV file to your working directory
write.csv(gene_annotation, file = "/Users/shivanimalik/Documents/TCGA_data/geo/GSE65904/gene_annotation.csv", row.names = FALSE)

