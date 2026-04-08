# Get started

``` r
library(coedata)
```

The functions on this page all help with processing data related to
individual churches:

- [`coe_churches()`](https://church-army.github.io/coedata/reference/coe_churches.md)
  returns a tibble of every church in the Church of England, including
  information on its parish, benefice, deanery, archdeaconry and
  diocese. Data are read directly from the [ESRI feature
  server](https://services5.arcgis.com/KDRjxGRQDVgVtFTS/ArcGIS/rest/services/Churches_ACNY_Nov2024/FeatureServer)
  kindly provided by the Church of England’s Data Services team.
- [`coe_esri_fields()`](https://church-army.github.io/coedata/reference/coe_esri_fields.md)
  is a helper function that returns valid fields which can be passed to
  the `where` argument of
  [`coe_churches()`](https://church-army.github.io/coedata/reference/coe_churches.md)
  to query the dataset.
- [`coe_parish_from_church()`](https://church-army.github.io/coedata/reference/coe_parish_from_church.md)
  returns a parish code for each of any number of church codes. Useful
  for obtaining a parish code from the church codes listed at [A Church
  Near You](https://www.achurchnearyou.com/)

## coe_churches()

Get tidy data on Church of England churches.

``` r
coe_churches(where = "Church_Cod = 608186") |>
  dplyr::glimpse()
#> Rows: 1
#> Columns: 14
#> $ church_name       <chr> "Leytonstone: St Margaret"
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

## coe_parish_from_church()

Get the parish code of any number of churches.

``` r
coe_parish_from_church(c(635041, 623001))
#> Re-reading with feature count reset from 1 to 0
#> Warning: Unknown or uninitialised column: `ParishID`.
#> Warning: Unknown or uninitialised column: `ChurchCode`.
#> NULL
```

## coe_esri_fields()

This tiny function returns the names of the fields used in the Feature
Server of Churches provided by CoE Data Services through ESRI.

``` r
coe_esri_fields()
#>  [1] "FID"        "Church_Cod" "ChurchName" "ACNY_id"    "ACNY_url"  
#>  [6] "Church_Her" "LBGrade"    "ParLocNa"   "ParLegNa"   "ParishID"  
#> [11] "BenefNa"    "BenefID"    "DeanNa"     "DeanID"     "ArchdNa"   
#> [16] "ArchdID"    "DioNa"      "DioID"
```
