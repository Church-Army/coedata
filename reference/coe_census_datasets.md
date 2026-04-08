# Browse all available datasets of ONS census 2021 data

Browse all available datasets of ONS census 2021 data

## Usage

``` r
coe_census_datasets(description = TRUE)
```

## Arguments

- description:

  Logical. If TRUE, (the default), a tibble is returned that contains
  ONS ids and corresponding dataset descriptions. If false, a character
  vector containing only ONS ids is returned.

## Value

A tibble of ONS ids and dataset descriptions, or a character vector of
ONS ids.

## Examples

``` r
coe_census_datasets() |>
  dplyr::glimpse()
#> Rows: 15
#> Columns: 2
#> $ ons_id      <chr> "TS001", "TS004", "TS007A", "TS021", "TS030", "TS037", "TS…
#> $ description <chr> "TS001 - Number of usual residents in households and commu…
```
