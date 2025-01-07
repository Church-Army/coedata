## dplyr methods for class coe_parish_data
#
# ### Summary
#
# tbl_sum.coe_parish_data <- function(x, ...){
#   c(
#     "Church of England Parish Data",
#     NextMethod()
#   )
# }

### Generics for extending to subclass

# dplyr_row_slice.coe_parish_data <- function(data, i, ...){
#
#   units <- attr(data, "units")
#   nomis_code <- attr(data, "nomis_code")
#   description <- attr(data, "description")
#   relative <- attr(data, "relative")
#
#   x <- NextMethod(data)
#
#   attr(x, "units") <- units
#   attr(x, "nomis_code") <- nomis_code
#   attr(x, "description") <- description
#   attr(x, "relative") <- relative
#
#   x
# }

# dplyr_col_modify.coe_parish_data <- function(data, cols){
#
#   units <- attr(data, "units")
#   nomis_code <- attr(data, "nomis_code")
#   description <- attr(data, "description")
#   relative <- attr(data, "relative")
#
#   x <- NextMethod(data)
#
#   attr(x, "units") <- units
#   attr(x, "nomis_code") <- nomis_code
#   attr(x, "description") <- description
#   attr(x, "relative") <- relative
#
#   x
# }

# dplyr_reconstruct.coe_parish_data <- function(data, template){
#   units <- attr(data, "units")
#   nomis_code <- attr(data, "nomis_code")
#   description <- attr(data, "description")
#   relative <- attr(data, "relative")
#
#   x <- NextMethod(data)
#
#   attr(x, "units") <- units
#   attr(x, "nomis_code") <- nomis_code
#   attr(x, "description") <- description
#   attr(x, "relative") <- relative
#
#   x
# }

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
