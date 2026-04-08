# coe-census-data

``` r
library(coedata)
```

The functions on this page are all used for reading 2021 ONS census data
for Church of England geographies. You can browse available datasets
with
[`coe_census_datasets()`](https://church-army.github.io/coedata/reference/coe_census_datasets.md).
Once you know the ONS ID of the dataset you need, you can:

- Get census data at a level of your choosing with the general-purpose
  function
  [`coe_census()`](https://church-army.github.io/coedata/reference/coe_census.md)
  - Get parish-level data with
    [`coe_census_parish()`](https://church-army.github.io/coedata/reference/coe_census_parish.md)
  - Get diocese-level data with
    [`coe_census_diocese()`](https://church-army.github.io/coedata/reference/coe_census_diocese.md)
  - Get data for all of england with
    [`coe_census_england()`](https://church-army.github.io/coedata/reference/coe_census_england.md)

You can also compare a parish with its diocese and the whole of england
in a single table with
[`coe_parish_snapshot()`](https://church-army.github.io/coedata/reference/coe_parish_snapshot.md)

## View available data with `coe_census_datasets()`

[`coe_census_datasets()`](https://church-army.github.io/coedata/reference/coe_census_datasets.md)
displays information on all the census datasets available through this
package. By default, the function returns a two-column tibble including
`ons_id` and `description`, but setting `description = FALSE` will
return a character vector of all valid ONS ids that can be passed to
functions such as
[`coe_census()`](https://church-army.github.io/coedata/reference/coe_census.md).

Parish-level datasets were produced by Ken Eames, Senior Statistical
Researcher at the Church of England’s Data Services team. The original
datasets are available on the [Church of England
website](https://www.churchofengland.org/about/data-services/resources-publications-and-data).
This package uses data that were last updated November 2024. If you
notice that the source data have since been updated, please create a
Github issue at <https://github.com/Church-Army/coedata>

``` r
coe_census_datasets() |>
  dplyr::glimpse()
#> Rows: 15
#> Columns: 2
#> $ ons_id      <chr> "TS001", "TS004", "TS007A", "TS021", "TS030", "TS037", "TS…
#> $ description <chr> "TS001 - Number of usual residents in households and commu…
```

## Obtain census statistics for a parish, diocese, or the nation with `coe_census()`

Get statistics on a particular topic, for a particular geographical
level, filtering as required. Levels include ‘parish’, ‘diocese’ or
‘england’. Parishes can be filtered with parish codes and dioceses with
diocese numbers, but national-level tables are comprised of a single row
and cannot be filtered.

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

## Obtain parish-level data with `coe_census_parish()`

A convenient wrapper around
[`coe_census()`](https://church-army.github.io/coedata/reference/coe_census.md)
for getting parish-level statistics for parishes of your choosing

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

## Obtain diocese-level data with `coe_census_diocese()`

A convenient wrapper around
[`coe_census()`](https://church-army.github.io/coedata/reference/coe_census.md)
for getting diocese-level statistics for dioceses of your choosing

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

## Obtain data for all of England with `coe_census_england()`

A convenient wrapper around
[`coe_census()`](https://church-army.github.io/coedata/reference/coe_census.md)
for getting national-level stats for a topic of your choosing

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

## Compare a parish to it’s diocesan and national context with `coe_parish_snapshot()`

Get a contextual ‘snapshot’ of any given parish for any number of census
topics, comparing the parochial statistics with those of the diocese and
the whole of England. A wrapper around
[`coe_census_parish()`](https://church-army.github.io/coedata/reference/coe_census_parish.md),
[`coe_census_diocese()`](https://church-army.github.io/coedata/reference/coe_census_diocese.md)
and
[`coe_census_england()`](https://church-army.github.io/coedata/reference/coe_census_england.md)
to obtain relative statistics for each geography and combine them into a
single table, iterating over census topics to return a list.

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
```

## A note on socio-economic classification labels

Most of the statistics used in this package are labelled very
intuitively, using labels like `general_health_very_good` or
`country_of_birth_middle_east_asia`. This is not true of the
socio0economic classification data (TS062), which uses labels like
`ns_sec_L1_3`. To understand these labels, please consult the table
returned by
[`ns_sec_descriptions()`](https://church-army.github.io/coedata/reference/ns_sec_descriptions.md).
