args <- commandArgs(trailingOnly = TRUE) 
setwd(paste(args[1], "temp",sep = "/"))
if (!require("tidyverse")) 
  install.packages("tidyverse")
library(tidyverse)

table.A <- read.table("compounds.txt", fill = T, sep = "\t") %>%
  as_tibble() %>%
  select(V2, V6) %>%
  filter(V2 != "" & V6 != "NA") 
table.A2 <- table.A %>%
  mutate(run = cumsum(str_to_lower(V2) == "Acetate" & is.na(V6))) %>%
  filter(run == 0) %>%
  nrow()

table.B <- read.table("header.txt", fill = T, sep = "\t", row.names = NULL) %>%
  as_tibble()

table.B2 <- table.B %>%
  filter( .data[[ names(table.B)[1] ]] == "Data File Name") %>%
  select(names(table.B)[2]) %>%
  slice(rep(1:n(), each = paste(which(duplicated(table.A$V2))[1]-1) )) %>%
  bind_cols(table.A) 

table.B2 %>%
  group_by(.data[[ names(table.B2)[2] ]]) %>%
  mutate(row = row_number()) %>%
  pivot_wider(names_from = names(table.B2)[2], values_from = names(table.B2)[3]) %>%
  select(-row) %>%
  rename_with(~ "SampleID", .cols = 1) %>%
  write.csv("../out/output.concentration.csv", row.names = F)