# coedata (development version)

## coedata 0.9.1

### Bug fixes

* Removed various, breaking inconsistencies between census data tables between parish, diocese and national levels. These included:
  * Missing columns
  * Columns that should not have been there
  * Inconsistent names
  * Inconsistent column orderings

## coedata 0.9.0

coedata is ready for public testing!

### Changes

* Parish deprivation data is now available via `coe_parish_deprivation()`
* Small updates to vignettes

## coedata 0.0.3

### Changes

* Diocese-level data is now sourced directly from a weighted summation of the intersections between LLSOAs and dioceses. The previous method of summing parish-level statistics incurred a slight rounding error.
* Parish-level tibbles with class `"coe_parish_data"` now attribute the Church of England when printed.

## coedata 0.0.2

The package is nearly ready to go:

* Functions renamed for consistency
* Lots of documentation added
* Updated README

## coedata 0.0.1

* The foundational functions of the package are working!
