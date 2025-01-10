#' Filter SNPs by MAF and Missing Data Thresholds
#'
#' @param hapmap_data A data frame containing hapmap data.
#' @param maf_threshold The minimum minor allele frequency to retain a SNP.
#' @param missing_threshold The maximum percentage of missing data to retain a SNP.
#' @return A filtered data frame of SNPs.
#' @export
filter_snps <- function(hapmap_data, maf_threshold = 0.05, missing_threshold = 0.05) {
  filtered_data <- hapmap_data[
    hapmap_data$MAF >= maf_threshold & hapmap_data$MissingData <= missing_threshold,
  ]
  return(filtered_data)
}
