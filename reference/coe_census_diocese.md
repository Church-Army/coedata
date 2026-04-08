# Obtain diocese-level census statistics on a given topic

Obtain diocese-level census statistics on a given topic

## Usage

``` r
coe_census_diocese(ons_id, diocese_numbers, ...)
```

## Arguments

- ons_id:

  The ONS id for the required topic

- diocese_numbers:

  Diocese numbers of required dioceses. If empty (the default) data for
  all dioceses are returned.

- ...:

  Other arguments passed to
  [`coe_census()`](https://church-army.github.io/coedata/reference/coe_census.md)

## Examples

``` r
coe_census_diocese(ons_id = "TS062", diocese_numbers = c(3, 7), relative = TRUE)
#> Church of England Census Data
#> TS062 - Social Classification (NS-SeC) 
#> Units:  Proportion of all persons_sixteen_plus 
#> # A tibble: 2 × 12
#>   diocese_name diocese_number population_16_and_over ns_sec_L1_3 ns_sec_L4_6
#>   <chr>                 <dbl>                  <dbl>       <dbl>       <dbl>
#> 1 Blackburn                 3                1124181       0.102       0.191
#> 2 Carlisle                  7                 418322       0.109       0.193
#> # ℹ 7 more variables: ns_sec_L7 <dbl>, ns_sec_L8_9 <dbl>, ns_sec_L10_11 <dbl>,
#> #   ns_sec_L12 <dbl>, ns_sec_L13 <dbl>, ns_sec_L14 <dbl>, ns_sec_L15 <dbl>
```
