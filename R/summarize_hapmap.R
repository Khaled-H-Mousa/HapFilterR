#' Summarize Hapmap Data
#'
#' @param hapmap_data A data frame of hapmap data.
#' @return A list containing summary statistics like the number of SNPs, average MAF, and missing data percentage.
#' @export
summarize_hapmap <- function(hapmap_data) {
  num_snps <- nrow(hapmap_data)
  avg_maf <- mean(hapmap_data$MAF, na.rm = TRUE)
  avg_missing <- mean(hapmap_data$MissingData, na.rm = TRUE)

  summary <- list(
    num_snps = num_snps,
    avg_maf = avg_maf,
    avg_missing = avg_missing
  )
  return(summary)
}
