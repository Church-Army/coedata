# Get census data for the Church of England at a parish, diocesan or national level.

Get census data for the Church of England at a parish, diocesan or
national level.

## Usage

``` r
coe_census(ons_id, level, areas, relative = FALSE)
```

## Arguments

- ons_id:

  The ONS id of required data. Must be one of
  [`coe_census_datasets()`](https://church-army.github.io/coedata/reference/coe_census_datasets.md).

- level:

  The geographical level at which data are required. Must be one of
  'parish', 'diocese' or 'england'.

- areas:

  A character vector of parish codes or diocese numbers. If specified,
  the returned tibble will contain only data for these areas. Cannot be
  used with `level = 'england'`. `NA` values will be removed.

- relative:

  Logical. Should returned table contain absolute statitiscs (e.g.
  persons/households) or proportions for each area?

## Value

A
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
containing census data for the Church of England

## Examples

``` r
coe_census(ons_id =  "TS001", level = "england")
#> Church of England Census Data
#> TS001 - Number of usual residents in households and communal establishments 
#> Units:  persons 
#> # A tibble: 1 × 3
#>   population lives_in_a_household lives_in_a_communal_establishment
#>        <dbl>                <dbl>                             <dbl>
#> 1   56490048             55504302                            985746
coe_census(ons_id = "TS001", level = "diocese", areas = 1)
#> Church of England Census Data
#> TS001 - Number of usual residents in households and communal establishments 
#> Units:  persons 
#> # A tibble: 1 × 5
#>   diocese_name diocese_number population lives_in_a_household
#>   <chr>                 <dbl>      <dbl>                <dbl>
#> 1 Bath & Wells              1     980098               960221
#> # ℹ 1 more variable: lives_in_a_communal_establishment <dbl>
```
