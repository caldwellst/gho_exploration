library(tidyverse)
library(jsonlite)

# Getting available indicators
# It returns a list of length 2, with what we want as the second element
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

# Simple function
get_data <- function(indicator) {
  if (!(indicator %in% sets$name)) {
    stop(sprintf("%s is not in the indicator database.", indicator))
  }
  ret <- jsonlite::fromJSON(paste0("https://ghoapi.azureedge.net/api/", indicator))
  ret[[2]]
}

# SDGTOBACCO test
get_data("SDGTOBACCO")

# FAKE TEST
get_data("fake")
