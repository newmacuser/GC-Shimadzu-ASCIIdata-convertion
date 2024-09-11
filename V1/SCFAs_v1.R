args <- commandArgs(trailingOnly = TRUE) 
setwd(paste(args[1], "temp",sep = "/"))
if (!require("tidyverse")) 
  install.packages("tidyverse")
library(tidyverse)

table.A <- read.table("compounds.txt", fill = T, sep = "\t") %>%
  as_tibble() %>%
  select(V2, V6) %>%
  filter(V2 != "") 

read.table("header.txt", fill = T, sep = "\t", row.names = NULL) %>%
  as_tibble() %>%
  filter(row.names == "Data File Name") %>%
  select("X.Header.") %>%
  slice(rep(1:n(), each = 6)) %>%
  bind_cols(table.A) %>%
  group_by(V2) %>%
  mutate(row = row_number()) %>%
  pivot_wider(names_from = "V2", values_from = "V6") %>%
  select(-row) %>%
  rename("SampleID" = "X.Header.") %>%
  write.csv("../out/output.concentration.csv", row.names = F)
