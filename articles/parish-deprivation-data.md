# parish-deprivation-data

``` r
library(coedata)
```

## get_deprivation_data_for_parishes

### Get deprivation data with `coe_parish_deprivation()` or `coe_parish_imd()`

The English [Indices of Multiple
Deprivation](https://assets.publishing.service.gov.uk/media/5d8b399a40f0b609946034a4/IoD2019_Infographic.pdf)
are a way of raking every small area (LLSOA) in England from most to
least deprived. The Church of England’s Data Services team use these
data to produce deprivation statistics for every parish in the Church of
England, giving every parish a score and a rank from most to least
deprived. With coedata, you can view these data using the
[`coe_parish_deprivation()`](https://church-army.github.io/coedata/reference/coe_parish_deprivation.md)
function. By default, this function returns, for each parish:

- Overall deprivation score
- Overall deprivation rank
- Parish deprivation decile
- Parish deprivation percentile

However, the function paramaters can be adjusted so that scores and
ranks for IMD domains and subdomains are included, as well as additional
supplementary data.

Note that for ranks, deciles and percentiles, lower values correspond to
higher deprivation.

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
