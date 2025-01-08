library(vroom)
library(purrr)
library(fs)
library(dplyr)
library(stringr)
pkgload::load_all()

old_stats <- dir_ls(here("..", "england", "diocesan-stats"))
names(old_stats) <-
  path_file(old_stats) |>
  path_ext_remove() |>
  str_remove_all("england_")




old_stats <- map(old_stats, vroom)

five_year <-
  coe_census_diocese("TS007A") |>
  select(-diocese_number, -population)

old_stats$`age-five-year` <-
  rename_with(old_stats$`age-five-year`, str_remove, everything(), "_years") |>
  rename(diocese_name = diocese)

five_year$source <- "new"
old_stats$`age-five-year`$source <- "old"

diocese_compare <-
  rbind(five_year, old_stats$`age-five-year`) |>
  relocate(source) |>
  arrange(diocese_name) |>
  mutate(diocese_name =
           str_replace_all(diocese_name, "\\.", " ") |>
           str_replace_all("&", "and"))


group_by(diocese_compare, diocese_name) |>
  summarise(across(where(is.numeric), \(x) x[source == "new"] - x[source == "old"]))

diocese_compare |>
  rowwise() |>
  mutate(ppn = sum(c_across(where(is.numeric)))) |>
  ungroup() |>
  mutate(across(where(is.numeric), \(x) x/ppn)) |>
  select(-ppn) |>
  group_by(diocese_name) |>
  summarise(across(where(is.numeric), \(x) x[source == "new"] - x[source == "old"])) |>
  mutate(across(where(is.numeric), scales::label_percent()))

