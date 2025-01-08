
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

- [x] [Parish-level census
  data](https://www.churchofengland.org/about/data-services/resources-publications-and-data)
  from ONS’ 2021 Census of England and Wales (Updated November 2024)
- [x] A
  [database](https://services5.arcgis.com/KDRjxGRQDVgVtFTS/ArcGIS/rest/services/Churches_ACNY_Nov2024/FeatureServer)
  of Churches, Parishes, Dioceses and other geographies (Updated
  November 2024)
- [ ] ~~[Parish-level
  data](https://www.churchofengland.org/about/data-services/resources-publications-and-data)
  from the 2019 Index of Multiple Deprivation~~ (PENDING)

National-level data are sourced directly from ONS data via
[nomis](https://www.nomisweb.co.uk/) (via
[nomisr](https://github.com/ropensci/nomisr)).

## Installation

You can install the development version of coedata from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("Church-Army/coedata")
```

## Documentation

Full documentation website on: <https://Church-Army.github.io/coedata>

## A simple example

Let’s use `coedata` to get 2021 census data on general health for a
couple of parishes. We’ll use the neighbouring parishes of **Stifford:
St Mary** (parish code 580342) and **Grays: St Peter and St Paul**
(parish code 580334).

### Sidebar: parish codes

When you’re looking at individual parishes with `coedata`, you’ll need
to identify them with their unique parish codes. If you’re not sure what
the parish code is for a parish or church, you can either:

- Find the parish in the [intercative
  map](https://www.arcgis.com/home/webmap/viewer.html?webmap=67bce0ed36dd4ee0af7a16bc079aa09a)
  provided by the Church of England’s Data Services team
- Find the church’s church code by clicking ‘more information’ on its [A
  Church Near You](https://www.achurchnearyou.com) page, and then use
  `coe_parish_from_church()` to find it’s parish code.

## Back to the example

We need to know which ONS dataset contains the general health data we
need. Let’s take a look at all the available datasets:

``` r
coe_census_datasets()
#> # A tibble: 15 × 2
#>    ons_id description                                                           
#>    <chr>  <chr>                                                                 
#>  1 TS001  TS001 - Number of usual residents in households and communal establis…
#>  2 TS004  TS004 - Country of birth                                              
#>  3 TS007A TS007A - Age by 5 year age bands                                      
#>  4 TS021  TS021 - Ethnic group                                                  
#>  5 TS030  TS030 - Religion                                                      
#>  6 TS037  TS037 - General health                                                
#>  7 TS062  TS062 - Social Classification (NS-SeC)                                
#>  8 TS066  TS066 - Economic activity status                                      
#>  9 TS067  TS067 - Highest level of qualification                                
#> 10 TS011  TS011 - Households by deprivation dimensions                          
#> 11 TS025  TS025 - Household language                                            
#> 12 TS044  TS044 - Accommodation type                                            
#> 13 TS045  TS045 - Car or van availability                                       
#> 14 TS054  TS054 - Tenure                                                        
#> 15 TS003  TS003 - Household composition
```

We can see from the table that the General Health dataset has ONS ID
**TS037**. Now that we have our parish codes and the ONS ID, we can get
parish-level data:

``` r
coe_census_parish(ons_id = "TS037", parish_codes = c(580342, 580334))
#> ✔ Reading from "coeparishdata_parish-data".
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
```

The above code has returned a table that counts individuals in each
parish, but we could also have passed `relative = TRUE` to
`coe_census_parish` to get those values as fractions of the parish
population.

### Example 2: Viewing a parish in its diocesan and national contexts

Sometimes people want to see how their parish compares to its diocese
and to the nation as a whole. `coedata` contains a function that returns
this data for any parish and any number of ONS datasets:

``` r
coe_parish_snapshot(580342, ons_ids = "TS037")
#> $TS037
#> Church of England Census Data
#> TS037 - General health 
#> Units:  Proportion of all persons 
#> # A tibble: 3 × 9
#>   level   level_code level_name        population general_health_very_good
#>   <chr>   <chr>      <chr>                  <dbl>                    <dbl>
#> 1 parish  580342     Stifford: St Mary       6332                    0.467
#> 2 diocese 8          Chelmsford           3279964                    0.497
#> 3 nation  <NA>       england             56490046                    0.485
#> # ℹ 4 more variables: general_health_good <dbl>, general_health_fair <dbl>,
#> #   general_health_bad <dbl>, general_health_very_bad <dbl>
```

## Thanks and attribution

- All census data was originally rovided by the [Office for National
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

- [x] Replace national level data with NOMIS census data
  - Aggregating parish data causes considerable rounding error
- [x] Add data-dictionary vignettes
- [x] Create print methods for `"coe_parish_data"` class
- [x] Create methods for `dplyr` that preserve attributes in
  `"coe_parish_data"` objects
- [ ] Add IMD data
- [x] Ensure appropriate credit/attribution/documentation
- [x] Rename everything, perhaps including this package
