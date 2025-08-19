library(dplyr)
library(readr)
library(zoo)
setwd("C:/") # add path to files

load_data <- function(file, date_label) {
  df <- read_csv(file) %>%
    filter(lat >= 51.7 & lat <= 52 & river_name == "Chilcotin River" & lon >= -122.8256 & lon <= -122.7269) %>%
    mutate(Date = date_label)
  
  # De-spiking data
  # Apply rolling median filter to wse
  df <- df %>%
    arrange(lon) %>%  # Ensure data is sorted before applying rolling median
    mutate(wse_filtered = rollapply(wse, width = 5, FUN = median, fill = NA, align = "center")) %>%
    filter(!is.na(wse_filtered))
  
  return(df)
}

dates <- c("20240712", "20240802", "20240813", "20240908")

for (date in dates) {
  df <- load_data(paste0(date, ".csv"), format(as.Date(date, "%Y%m%d"), "%B %d, %Y"))
  write.csv(df, paste0(date, " - filtered.csv"), row.names = FALSE)
}