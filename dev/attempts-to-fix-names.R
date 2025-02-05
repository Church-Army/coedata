## fixing diocese data
## Don't try to run this - it might break something.

pkgload::load_all()
library(dplyr)

datasets <-
  filter(parish_data, ons_id %in% c("TS007A", "TS067"),
         level == "diocese") |>
  pull(data)

datasets_england <-
  filter(parish_data, ons_id %in% c("TS007A", "TS067"),
         level == "england") |>
  pull(data)

library(stringr)

ts067 <- rename_with(datasets[[2]], str_remove, everything(), "of_")

# ts007a <- rename_with(datasets[[1]],
#                       \(x){
#                         str_replace(x, "(?<=\\d)_(?=\\d)", "_to_")
#                       })


ts007a <- rename_with(datasets[[1]],
                      \(x){
                        str_remove(x, "to_")
                      })

ts007a_england <- rename_with(datasets_england[[1]],
                      \(x){
                        str_remove(x, "to_")
                      })

parish_data[["data"]][parish_data$level == "diocese" & parish_data$ons_id == "TS067"] <- list(ts067)
parish_data[["data"]][parish_data$level == "diocese" & parish_data$ons_id == "TS007A"] <- list(ts007a)
parish_data[["data"]][parish_data$level == "england" & parish_data$ons_id == "TS007A"] <- list(ts007a_england)

## Religion relocation
parish_data[["data"]][parish_data$level == "diocese" & parish_data$ons_id == "TS030"][[1]] <-
  relocate(parish_data[["data"]][parish_data$level == "diocese" & parish_data$ons_id == "TS030"][[1]],
           religion_no_religion, .after = religion_other_religion)

parish_data[["data"]][parish_data$level == "england" & parish_data$ons_id == "TS030"][[1]] <-
  relocate(parish_data[["data"]][parish_data$level == "england" & parish_data$ons_id == "TS030"][[1]],
           religion_no_religion, .after = religion_other_religion)


## Accommodation type
parish_data[["data"]][parish_data$level == "diocese" & parish_data$ons_id == "TS044"][[1]] <-
  select(parish_data[["data"]][parish_data$level == "diocese" & parish_data$ons_id == "TS044"][[1]],
         -accommodation_type_total)


##### use_data(parish_data, internal = TRUE, overwrite = TRUE)
