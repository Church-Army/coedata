
<!-- README.md is generated from README.Rmd. Please edit that file -->

# coedata

<!-- badges: start -->

[![R-CMD-check](https://github.com/Church-Army/coedata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Church-Army/coedata/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/Church-Army/coedata/graph/badge.svg)](https://app.codecov.io/gh/Church-Army/coedata)
<!-- badges: end -->

coedata is a data package that serves up various datasets made available
by the Church of England’s [Data
Services](https://www.churchofengland.org/about/data-services) team.
Data sources include:

- Parish, diocese and national-level 2021 census data (Updated November
  2024)
- A database of Churches, Parishes, Dioceses and other geographies
  (Updated November 2024)
- Parish-level data from the 2019 Index of Multiple Deprivation (Updated
  November 2024)

## Installation

You can install the development version of coedata from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("Church-Army/coedata")
```

## Documentation

Full documentation website on: <https://Church-Army.github.io/coedata>

## Usage

### Using coedata to get parish-level census statistics

This is an example of how you could use coedata to get 2021 census data
on general health for a selection of parishes. We’ll use the
neighbouring parishes of **Stifford: St Mary** and **Grays: St Peter and
St Paul**.

To get this data, we’ll need:

- The parish codes of those parishes
- The ONS ID of the general health dataset

We can find the ONS ID of the general health dataset by using
`coe_datasets()`, which lists the ID of every census dataset that’s a
available through this package:

``` r
coe_census_datasets() |> 
  knitr::kable()
```

| ons_id | description |
|:---|:---|
| TS001 | TS001 - Number of usual residents in households and communal establishments |
| TS004 | TS004 - Country of birth |
| TS007A | TS007A - Age by 5 year age bands |
| TS021 | TS021 - Ethnic group |
| TS030 | TS030 - Religion |
| TS037 | TS037 - General health |
| TS062 | TS062 - Social Classification (NS-SeC) |
| TS066 | TS066 - Economic activity status |
| TS067 | TS067 - Highest level of qualification |
| TS011 | TS011 - Households by deprivation dimensions |
| TS025 | TS025 - Household language |
| TS044 | TS044 - Accommodation type |
| TS045 | TS045 - Car or van availability |
| TS054 | TS054 - Tenure |
| TS003 | TS003 - Household composition |

We can see that general health data can be found in the dataset with ID
TS037.

Luckily, we already know the parish codes for the parishes we’re
interested in. If you’re not sure where to find the parish codes you
need, please refer to [Finding parish codes](#finding-parish-codes).

Now that we have the ONS ID and the parish codes, we can get our census
data:

``` r
coe_census_parish(ons_id = "TS037", parish_codes = c(580342, 580334))
#> ✔ Reading from "coedata_parish-data".
#> ✔ Range ''TS037''.
#> Church of England Census Data
#> TS037 - General health 
#> Units:  persons 
#> # A tibble: 2 × 7
#>   parish_code population general_health_very_good general_health_good
#>   <chr>            <dbl>                    <dbl>               <dbl>
#> 1 580334           49315                   26735.              16254.
#> 2 580342            6332                    2956.               2160.
#> # ℹ 3 more variables: general_health_fair <dbl>, general_health_bad <dbl>,
#> #   general_health_very_bad <dbl>
#> Parish-level data compiled by the Church of England
```

Those parishes are both in central London - they are very densely
populated!

Note that we can also get relative statistics for the same data by
setting `relative = TRUE`:

``` r
coe_census_parish(ons_id = "TS037", parish_codes = c(580342, 580334), relative = TRUE) 
#> Church of England Census Data
#> TS037 - General health 
#> Units:  Proportion of all persons 
#> # A tibble: 2 × 7
#>   parish_code population general_health_very_good general_health_good
#>   <chr>            <dbl>                    <dbl>               <dbl>
#> 1 580334           49315                    0.542               0.330
#> 2 580342            6332                    0.467               0.341
#> # ℹ 3 more variables: general_health_fair <dbl>, general_health_bad <dbl>,
#> #   general_health_very_bad <dbl>
#> Parish-level data compiled by the Church of England
```

For more information on getting census data, see
`vignette("CoE Census Statistics")`.

### Using coedata to get parish-level deprivation statistics

The CoE produce deprivation data for every parish in england, which can
be accessed like so:

``` r
coe_parish_deprivation(parish_codes = c(580342, 580334))
#> ✔ Reading from "coe_parish_imd_2019".
#> ✔ Range ''imd''.
#> Church of England Deprivation Data
#> # A tibble: 2 × 6
#>   parish_code parish_name imd_score imd_rank imd_rank_decile imd_rank_percentile
#>         <dbl> <chr>           <dbl>    <dbl>           <dbl>               <dbl>
#> 1      580334 Grays Thur…      17.2     5293               5                  44
#> 2      580342 Stifford         22.4     2883               3                  24
#> Parish-level data compiled by the Church of England
```

For more information on getting deprivation data, see
`vignette("Parish-level deprivation data")`

## Finding parish codes

When you’re looking at individual parishes with `coedata`, you’ll need
to identify them with their unique parish codes. If you’re not sure what
the parish code is for a parish or church, you can either:

- Find the parish in the [intercative
  map](https://www.arcgis.com/home/webmap/viewer.html?webmap=67bce0ed36dd4ee0af7a16bc079aa09a)
  provided by the Church of England’s Data Services team
- Find the church’s church code by clicking ‘more information’ on its [A
  Church Near You](https://www.achurchnearyou.com) page, and then use
  `coe_parish_from_church()` to find it’s parish code.

## Thanks and attribution

- All census data was originally provided by the [Office for National
  Statistics](https://www.ons.gov.uk/). ONS also maintain the
  [nomis](https://www.nomisweb.co.uk/) service, which was used to source
  some of this package’s internal data.
- Parish-level census data profiles were compiled by Ken Eames, who is a
  senior statistical researcher at the Church of England’s Data
  Services. Original parish-level datasets are available on the [Church
  of England
  website](https://www.churchofengland.org/about/data-services/resources-publications-and-data)
  - Ken also maintains the [parish
    map](https://www.arcgis.com/home/webmap/viewer.html?webmap=67bce0ed36dd4ee0af7a16bc079aa09a)
    from which Church data are read by this package. Thanks again, Ken!
- Thanks to [ropensci](https://github.com/ropensci) for their
  development and maintenance of the
  [nomisr](https://github.com/ropensci/nomisr) package, which was used
  to interface with nomis.
- Thanks to [Jenny Bryan](https://jennybryan.org/about/) at Posit for
  the development and maintenance of
  [googlesheets4](https://googlesheets4.tidyverse.org/), which provided
  a simple, secure way of minimising package size by storing data
  remotely.

## TODO:

- [ ] Add IMD data
