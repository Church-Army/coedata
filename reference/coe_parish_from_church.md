# Get the parish codes of any number of Church of England churches.

Get the parish codes of any number of Church of England churches.

## Usage

``` r
coe_parish_from_church(church_codes)
```

## Arguments

- church_codes:

  A character vector of church codes

## Value

A character vector of parish codes, with the same length as
`church_codes`

## Examples

``` r
coe_parish_from_church(c(635041, 623001))
#> Re-reading with feature count reset from 1 to 0
#> Warning: Unknown or uninitialised column: `ParishID`.
#> Warning: Unknown or uninitialised column: `ChurchCode`.
#> NULL
```
