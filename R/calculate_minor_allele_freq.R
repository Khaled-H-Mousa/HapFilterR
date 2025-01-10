#' Calculate Minor Allele Frequency
#'
#' @param hapmap_data A data frame containing hapmap data.
#' @return A data frame with an additional column for Minor Allele Frequency (MAF).
#' @export
calculate_minor_allele_frequency <- function(hapmap_data) {
  maf <- apply(hapmap_data[ , -(1:11)], 1, function(snp) {
    alleles <- unlist(strsplit(snp, ""))
    freq <- table(alleles)
    minor <- min(freq / sum(freq))
    return(minor)
  })
  hapmap_data$MAF <- maf
  return(hapmap_data)
}

