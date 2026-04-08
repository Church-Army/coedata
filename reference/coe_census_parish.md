# Obtain parish-level census statistics on a given topic

Obtain parish-level census statistics on a given topic

## Usage

``` r
coe_census_parish(ons_id, parish_codes, ...)
```

## Arguments

- ons_id:

  The ONS id the required topic

- parish_codes:

  Parish codes of required parishes. If empty (the default) data for all
  parishes are returned.

- ...:

  Other arguments passed to
  [`coe_census()`](https://church-army.github.io/coedata/reference/coe_census.md)

## Examples

``` r
coe_census_parish(ons_id = "TS062", parish_codes = "350041", relative = TRUE)
#> ✔ Reading from coedata_parish-data.
#> ✔ Range ''TS062''.
#> Church of England Census Data
#> TS062 - Social Classification (NS-SeC) 
#> Units:  Proportion of all persons_sixteen_plus 
#> # A tibble: 1 × 11
#>   parish_code population_16_and_over ns_sec_L1_3 ns_sec_L4_6 ns_sec_L7
#>   <chr>                        <dbl>       <dbl>       <dbl>     <dbl>
#> 1 350041                       4548.      0.0818      0.0767    0.0362
#> # ℹ 6 more variables: ns_sec_L8_9 <dbl>, ns_sec_L10_11 <dbl>, ns_sec_L12 <dbl>,
#> #   ns_sec_L13 <dbl>, ns_sec_L14 <dbl>, ns_sec_L15 <dbl>
#> Parish-level data compiled by the Church of England
```
