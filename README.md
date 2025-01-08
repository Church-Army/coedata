
<!-- README.md is generated from README.Rmd. Please edit that file -->

# coedata

<!-- badges: start -->

[![R-CMD-check](https://github.com/Church-Army/coedata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Church-Army/coedata/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/Church-Army/coedata/graph/badge.svg)](https://app.codecov.io/gh/Church-Army/coedata)
<!-- badges: end -->

coedata is a data package that’s built around various datasets
made available by the Church of England’s [Data
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

Full documentation website on:
<https://Church-Army.github.io/coedata>

## TODO:

- [x] Replace national level data with NOMIS census data
  - Aggregating parish data causes considerable rounding error
- [ ] Add data-dictionary vignettes
- [x] Create print methods for `"coe_parish_data"` class
- [x] Create methods for `dplyr` that preserve attributes in
  `"coe_parish_data"` objects
- [ ] Add IMD data
- [ ] Ensure appropriate credit/attribution/documentation
- [ ] Rename everything, perhaps including this package
