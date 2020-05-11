library(tidyverse)
library(jsonlite)

# Getting available indicators
sets <- jsonlite::fromJSON("https://ghoapi.azureedge.net/api/")
sets <- sets[[2]]

# Confirming what we want is there
sets %>%
  filter(str_detect(name, "SDGTOBACCO"))

# Getting what we want!
df <- jsonlite::fromJSON("https://ghoapi.azureedge.net/api/SDGTOBACCO")
df <- tibble(df[[2]]) %>%
  mutate(Value = as.numeric(Value))

df
