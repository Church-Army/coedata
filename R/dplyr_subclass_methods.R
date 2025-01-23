

#' @export
#' @importFrom dplyr group_by
group_by.coe_parish_data <- function(.data, ..., .add = FALSE, .drop = dplyr::group_by_drop_default(.data)){
  units <- attr(.data, "units")
  nomis_code <- attr(.data, "nomis_code")
  description <- attr(.data, "description")
  relative <- attr(.data, "relative")

  x <- NextMethod(.data)

  attr(x, "units") <- units
  attr(x, "nomis_code") <- nomis_code
  attr(x, "description") <- description
  attr(x, "relative") <- relative

  if(!"coe_parish_data" %in% class(x)) class(x) <- c("coe_parish_data", class(x))

  x
}

#' @export
#' @importFrom dplyr rowwise
rowwise.coe_parish_data <- function(data, ...){

  units <- attr(data, "units")
  nomis_code <- attr(data, "nomis_code")
  description <- attr(data, "description")
  relative <- attr(data, "relative")

  x <- NextMethod(data)

  attr(x, "units") <- units
  attr(x, "nomis_code") <- nomis_code
  attr(x, "description") <- description
  attr(x, "relative") <- relative

  if(!"coe_parish_data" %in% class(x)) class(x) <- c("coe_parish_data", class(x))

  x
}

## Print method
#' @export
print.coe_parish_data <- function(x, ...){

  cat("Church of England Census Data\n")
  cat(attr(x, "description"), "\n")
  cat("Units: ", attr(x, "units"), "\n")

  NextMethod(x)

  if("parish_code" %in% names(x)) cat("Parish-level data compiled by the Church of England")
}


## Print method (deprivational data)
#' @export
print.coe_parish_data_imd <- function(x, ...){

  cat("Church of England Deprivation Data\n")

  NextMethod(x)

  if("parish_code" %in% names(x)) cat("Parish-level data compiled by the Church of England")
}
