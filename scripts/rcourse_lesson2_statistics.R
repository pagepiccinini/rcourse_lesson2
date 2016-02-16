## READ IN DATA ####
source("scripts/rcourse_lesson2_cleaning.R")


## LOAD PACKAGES #####
# [none currently needed]


## ORGANIZE DATA ####
data_stats = data_clean


## BUILD MODEL - PROPORTION OF 'PAGE'S BY YEAR (CONTINUOUS PREDICTOR) ####
# Make linear regression model
year.lm = lm(prop_log10 ~ year, data = data_stats)

# Summarise model and save
year.lm_sum = summary(year.lm)

# Call summary of model
year.lm_sum

# Save residuals of model
year.lm_resid = resid(year.lm)

# Call first first residuals
head(year.lm_resid)


## BUILD MODEL - PROPORTION OF 'PAGE'S BY SEX (CATEGORICAL PREDICTOR) ####
# Make linear regression model
sex.lm = lm(prop_log10 ~ sex, data = data_stats)

# Summarise model and save
sex.lm_sum = summary(sex.lm)

# Call summary of model
sex.lm_sum

# Save residuals of model
sex.lm_resid = resid(sex.lm)

# Call first first residuals
head(sex.lm_resid)
