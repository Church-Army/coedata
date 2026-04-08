# Get a list of comparative table(s) of local, diocesan and national data for a given parish

Extracts parish, diocese and national level data fcor a given parish,
then [base::rbind](https://rdrr.io/r/base/cbind.html)s them into a
single table. Iterates over `ons_ids` to output a list of such tables

## Usage

``` r
coe_parish_snapshot(
  parish_code,
  ons_ids = coe_census_datasets(description = FALSE),
  relative = TRUE
)
```

## Arguments

- parish_code:

  A single parish code. Character.

- ons_ids:

  A character vector of ons_ids.

- relative:

  Logical. Should outputs be relative? Default is `TRUE`.

## Value

A list of `coe_parish_data` tibbles

## Examples

``` r
coe_parish_snapshot(parish_code = "370047", ons_ids = "TS001")
#> ✔ Reading from coedata_parish-data.
#> ✔ Range ''TS001''.
#> $TS001
#> Church of England Census Data
#> TS001 - Number of usual residents in households and communal establishments 
#> Units:  Proportion of all persons 
#> # A tibble: 3 × 6
#>   level   level_code level_name                population lives_in_a_household
#>   <chr>   <chr>      <chr>                          <dbl>                <dbl>
#> 1 parish  370047     South Dulwich: St Stephen       6680                0.983
#> 2 diocese 37         Southwark                    2877245                0.988
#> 3 nation  NA         England                     56490048                0.983
#> # ℹ 1 more variable: lives_in_a_communal_establishment <dbl>
#> 
```
