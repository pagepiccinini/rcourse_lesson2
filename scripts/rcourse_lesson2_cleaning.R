## LOAD PACKAGES ####
library(dplyr)


## READ IN DATA ####
data = read.table("data/rcourse_lesson2_data.txt", header=T, sep="\t")


## CLEAN DATA ####
data_clean = data %>%
  # Look at only one name
  filter(name == "Page") %>%
  # --> PP NOTE: Add in after first xtabs call too crazy
  # Drop residual information of other names from data frame
  mutate(name = factor(name)) %>%
  # Only look at data from after year 1900
  filter(year > 1900) %>%
  # Only look at data up to the year 2000 
  filter(year <= 2000) %>%
  # Add log transforms for both log base e and log base 10
  mutate(prop_loge = log(prop)) %>%
  mutate(prop_log10 = log10(prop))

# Confirm the name you've chosen is there (if it is not the number of rows will be 0)
dim(data_clean)

# Double check only one name chosen
xtabs(~name, data_clean)

# Confirm minimum year greater than 1900
min(data_clean$year)

# Confirm maximum year less than or equal to 2000
max(data_clean$year)