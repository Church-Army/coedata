# Get data on the Anglican geography on Church of England Churches, including their parish, benefice, arcdeaconry and diocese.

Reads church data from the Church of England's [Data Services ESRI
feature
server](https://services5.arcgis.com/KDRjxGRQDVgVtFTS/ArcGIS/rest/services/Churches_ACNY_Nov2024/FeatureServer),
dropping spatial data and returning a
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html).

## Usage

``` r
coe_churches(where = "1=1")
```

## Arguments

- where:

  An SQL query. The default returns all churches. See details.

## Value

A tibble in which each row corresponds to a church in the Church of
England

## Details

This function renames fields in the returned tibble, but any query
passed to `where` must use the original names of the ESRI data provided
by CoE data services. The names of these fields can be accessed via
[`coe_esri_fields()`](https://church-army.github.io/coedata/reference/coe_esri_fields.md)

## Examples

``` r
coe_churches(where = "Church_Cod = 608186") |>
  dplyr::glimpse()
#> Rows: 1
#> Columns: 13
#> $ church_code       <int> 608186
#> $ parish_name       <chr> "Leytonstone: St Margaret w St Columba"
#> $ parish_code       <int> 580186
#> $ benefice_name     <chr> "Leytonstone St Marg w St Columba"
#> $ benefice_id       <chr> "08/265 M"
#> $ deanery_name      <chr> "WALTHAM FOREST"
#> $ deanery_id        <int> 58108
#> $ archdeaconry_name <chr> "WEST HAM"
#> $ archdeaconry_id   <int> 581
#> $ diocese_name      <chr> "Chelmsford"
#> $ diocese_number    <int> 8
#> $ acny_id           <int> 6475
#> $ acny_url          <chr> "https://www.achurchnearyou.com/church/6475/"
```
