library(HapFilterR)

hapmap_data <- HapFilterR::read_hapmap(file_path = "Data/Barley_50K_KNNimp.hmp.tsv")
head(hapmap_data)
hapmap_data <- calculate_minor_allele_frequency(hapmap_data)
hapmap_data
hapmap_data <- analyze_missing_data(hapmap_data)
filtered_data <- filter_snps(hapmap_data, maf_threshold = 0.05, missing_threshold = 10)
summary_stats <- summarize_hapmap(filtered_data)
summary_stats
write.csv(filtered_data, file = "OUT/New_NEfiltered_data.csv", row.names = FALSE)
