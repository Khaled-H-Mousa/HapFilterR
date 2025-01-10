#' Analyze Missing Data
#'
#' @param hapmap_data A data frame containing hapmap data.
#' @return A data frame with an additional column for the percentage of missing data per snp.
#' @export
analyze_missing_data <- function(hapmap_data) {
  missing_percentage <- apply(hapmap_data[, -(1:11)], 1, function(snp) {
    n_missing <- sum(is.na(snp))
    n_total <- length(snp)
    return((n_missing / n_total) * 100)
  })
  hapmap_data$MissingData <- missing_percentage
  return(hapmap_data)
}

#apply(hapmap_data[, -c(1:11)], 1, function(snp)
#missing_rate <- missing_rate <- ifelse(n_total == 0, NA, (n_missing / n_total) * 100)
#return(missing_rate)
