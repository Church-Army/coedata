# Obtain national level census statistics on a given topic

Obtain national level census statistics on a given topic

## Usage

``` r
coe_census_england(ons_id, ...)
```

## Arguments

- ons_id:

  The ONS id for the required topic

- ...:

  Other arguments passed to
  [`coe_census()`](https://church-army.github.io/coedata/reference/coe_census.md)

## Examples

``` r
coe_census_england(ons_id = "TS062", relative = TRUE)
#> Church of England Census Data
#> TS062 - Social Classification (NS-SeC) 
#> Units:  Proportion of all persons_sixteen_plus 
#> # A tibble: 1 × 10
#>   population_16_and_over ns_sec_L1_3 ns_sec_L4_6 ns_sec_L7 ns_sec_L8_9
#>                    <dbl>       <dbl>       <dbl>     <dbl>       <dbl>
#> 1               46006957       0.132       0.199     0.114       0.106
#> # ℹ 5 more variables: ns_sec_L10_11 <dbl>, ns_sec_L12 <dbl>, ns_sec_L13 <dbl>,
#> #   ns_sec_L14 <dbl>, ns_sec_L15 <dbl>
```
