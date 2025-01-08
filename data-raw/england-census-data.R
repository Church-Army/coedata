## History of how national level data was obtained and renamed using `nomisr`

library(nomisr)
library(here)
library(stringr)
library(dplyr)
library(tidyr)
library(snakecase)
library(purrr)

all_nomis_datasets <- nomis_data_info()

load(here("R", "sysdata.rda"))

codes <- unique(parish_data$nomis_code)

codes_reprex <-
  codes |>
  str_c(" ") |>
  str_c(collapse = "|")


desired_census_sets <- filter(all_nomis_datasets, str_detect(name.value, codes_reprex))

nomis_codes_table <-
  select(desired_census_sets, name.value, id) |>
  mutate(census_code = str_extract(name.value, "TS[^ ]+(?= )"))

nomis_codes_table <-
  rowwise(nomis_codes_table) |>
  mutate(data = list(nomis_get_data(id, geography = "2092957699", measures = "20100")),
         data = list(data[c(14, 21)]),
         data = list(pivot_wider(data, names_from = 1, values_from = 2)),
         data = list(rename_with(data, to_snake_case, everything())))

package_col_names <-
  filter(parish_data, level == "diocese") |>
  rowwise() |>
  mutate(names = list(names(data)[!names(data) %in% c("diocese_name", "diocese_number")])) |>
  select(nomis_code, names)

nomis_codes_table <- left_join(nomis_codes_table, package_col_names, by = c("census_code" = "nomis_code"))

nomis_codes_table <- mutate(nomis_codes_table, names_compare = list(list(nomis = names(data), package = names)))




nomis_codes_table[["data"]][[1]] <-
  rename_with(nomis_codes_table[["data"]][[1]],
              \(x){
                str_remove_all(x, "years") |>
                  str_replace_all("aged", "age") |>
                  str_replace_all("_", " ") |>
                  str_squish() |>
                  str_replace_all(" ", "_")
              }) |>
  rename(population = 1)

nomis_codes_table[["data"]][[2]] <- rename(nomis_codes_table[["data"]][[2]], population = 1)

nomis_codes_table[["data"]][[3]] <-
  select(nomis_codes_table[["data"]][[3]],
         -any_of(c("single_family_household", "one_person_household", "other_household_types",
                   "household_composition_single_family_household_married_or_civil_partnership_couple",
                   "household_composition_single_family_household_cohabiting_couple_family",
                   "household_composition_single_family_household_lone_parent_family",
                   "household_composition_single_family_household_other_single_family_household_other_family_composition")
         )) |>
  rename_with(\(x) str_c("household_composition_", x)) |>
  rename(occupied_households = 1)

nomis_codes_table[["data"]][[4]] <-
  select(nomis_codes_table[["data"]][[4]],
         population = total_all_usual_residents,
         country_of_birth_europe_eu_countries = europe_eu_countries,
         country_of_birth_europe_non_eu_countries = europe_non_eu_countries_all_other_non_eu_countries,
         country_of_birth_africa = africa,
         country_of_birth_middle_east_and_asia = middle_east_and_asia,
         country_of_birth_the_americas_and_the_caribbean = the_americas_and_the_caribbean,
         country_of_birth_antarctica_and_oceania_including_australasia_and_other =
           antarctica_and_oceania_including_australasia_and_other,
         country_of_birth_british_overseas = british_overseas) |>
  rename(population = 1)

nomis_codes_table[["data"]][[5]] <-
  rename_with(nomis_codes_table[["data"]][[5]],
              \(x) str_c("deprivation_", x), starts_with("household_")) |>
  rename(occupied_households = 1)

nomis_codes_table[["data"]][[6]] <-
  select(nomis_codes_table[["data"]][[6]],
         total_all_usual_residents,
         asian_asian_british_or_asian_welsh,
         black_black_british_black_welsh_caribbean_or_african,
         mixed_or_multiple_ethnic_groups,
         white,
         other_ethnic_group) |>
  rename_with(\(x) str_c("ethnic_group_", x)) |>
  rename(population = 1)

nomis_codes_table[["data"]][[7]] <-
  rename_with(nomis_codes_table[["data"]][[7]], \(x) str_c("household_language_", x)) |>
  rename(occupied_households = 1)

nomis_codes_table[["data"]][[8]] <-
  rename_with(nomis_codes_table[["data"]][[8]], \(x) str_c("religion_", x)) |>
  rename(population = 1)

nomis_codes_table[["data"]][[9]] <-
  rename_with(nomis_codes_table[["data"]][[9]],
              \(x){
                str_remove(x, "_health") |>
                  str_c("general_health_", z = _)
              }) |>
  rename(population = 1)

nomis_codes_table[["data"]][[10]] <-
  rename_with(nomis_codes_table[["data"]][[10]], \(x) str_c("accommodation_type_", x)) |>
  rename(occupied_households = 1)


nomis_codes_table[["data"]][[11]] <-
  rename_with(nomis_codes_table[["data"]][[11]], \(x) str_c("car_or_van_availability_", x)) |>
  rename(occupied_households = 1)

nomis_codes_table[["data"]][[12]] <-
  select(nomis_codes_table[["data"]][[12]],
         owned_owns_outright,
         owned_owns_with_a_mortgage_or_loan,
         shared_ownership,
         social_rented_rents_from_council_or_local_authority,
         social_rented_other_social_rented,
         private_rented_private_landlord_or_letting_agency,
         private_rented_other_private_rented,
         lives_rent_free) |>
  rename_with(\(x) str_c("tenure_", x)) |>
  rename(occupied_households = 1)

names(nomis_codes_table[["data"]][[13]]) <- c("population_16_and_over", "ns_sec_L1_3", "ns_sec_L4_6", "ns_sec_L7",
                                              "ns_sec_L8_9", "ns_sec_L10_11", "ns_sec_L12", "ns_sec_L13", "ns_sec_L14",
                                              "ns_sec_L15")

nomis_codes_table[["data"]][[14]] <-
  select(nomis_codes_table[["data"]][[14]],
         total_all_usual_residents_aged_16_years_and_over,
         economically_active_excluding_full_time_students_in_employment,
         economically_active_excluding_full_time_students_unemployed,
         economically_active_and_a_full_time_student_in_employment,
         economically_active_and_a_full_time_student_unemployed,
         economically_inactive_retired, economically_inactive_student,
         economically_inactive_looking_after_home_or_family,
         economically_inactive_long_term_sick_or_disabled,
         economically_inactive_other
         ) |>
  rename_with(\(x) str_c("ea_status_", x)) |>
  rename(population_16_and_over = 1)


nomis_codes_table[["data"]][[15]] <-
  rename_with(nomis_codes_table[["data"]][[15]],
              \(x) str_c("highest_level_qualification_", x)) |>
  rename(population_16_and_over = 1)

new_data <- select(nomis_codes_table, census_code, nu_data = data)

parish_data <- left_join(parish_data, new_data, by = c("nomis_code" = "census_code"))

parish_data <- mutate(parish_data, data = if_else(level == "england", nu_data, data))

parish_data <- select(parish_data, -nu_data)

usethis::use_data(parish_data, internal = TRUE, overwrite = TRUE)
