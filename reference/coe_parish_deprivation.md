# Get parish-level deprivation data from the Church of England

coe_parish_deprivation and coe_parish_imd are the same function

## Usage

``` r
coe_parish_deprivation(
  parish_codes = TRUE,
  domains = FALSE,
  subdomains = FALSE,
  supplementary = FALSE
)

coe_parish_imd(
  parish_codes = TRUE,
  domains = FALSE,
  subdomains = FALSE,
  supplementary = FALSE
)
```

## Arguments

- parish_codes:

  Character vector of parish codes to return. The default (TRUE) returns
  all parish codes.

- domains:

  Logical. Should individual domains of deprivation be included?

- subdomains:

  Logical. Should subdomains be included?

- supplementary:

  Logical. Should supplementary statistics be included?

## Value

A tibble of deprivation data with one row per parish.

## Examples

``` r
coe_parish_deprivation("350259")
#> ✔ Reading from coe_parish_imd_2019.
#> ✔ Range ''imd''.
#> Church of England Deprivation Data
#> # A tibble: 1 × 6
#>   parish_code parish_name imd_score imd_rank imd_rank_decile imd_rank_percentile
#>         <dbl> <chr>           <dbl>    <dbl>           <dbl>               <dbl>
#> 1      350259 The Vine, …      30.0     1310               2                  11
#> Parish-level data compiled by the Church of England

coe_parish_deprivation("350259", domains = TRUE)
#> Church of England Deprivation Data
#> # A tibble: 1 × 26
#>   parish_code parish_name imd_score imd_rank imd_rank_decile imd_rank_percentile
#>         <dbl> <chr>           <dbl>    <dbl>           <dbl>               <dbl>
#> 1      350259 The Vine, …      30.0     1310               2                  11
#> # ℹ 20 more variables: barriers_to_housing_and_services_score <dbl>,
#> #   barriers_to_housing_rank <dbl>, crime_score <dbl>, crime_rank <dbl>,
#> #   education_skills_and_training_score <dbl>,
#> #   education_skills_and_training_rank <dbl>,
#> #   children_and_young_people_rank <dbl>, adult_skills_rank <dbl>,
#> #   employment_score_rate <dbl>, employment_rank <dbl>,
#> #   geographical_barriers_rank <dbl>, …
#> Parish-level data compiled by the Church of England
```
