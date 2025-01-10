#' Read Hapmap File
#'
#' @param file_path The file path to the hapmap file.
#' @param sep description
#' @return A data frame containing the hapmap data after validation.
#' @export
read_hapmap <- function(file_path , sep = "\t") {
  hapmap_data <- read.csv(file_path, header = TRUE, sep = sep, fill = TRUE)
  hapmap_data[hapmap_data=="NN"] <- NA
  return(hapmap_data)
}

