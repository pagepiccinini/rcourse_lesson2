## READ IN DATA ####
source("scripts/rcourse_lesson2_cleaning.R")


## LOAD PACKAGES ####
library(ggplot2)


## ORGANIZE DATA ####
data_figs = data_clean %>%
  # Update labels for sex to be nicer for figure
  mutate(sex = factor(sex, levels=c("F", "M"), labels=c("female", "male")))


## MAKE FIGURES ####
# Histogram of dependent variable (proportion of 'Page's)
name.plot = ggplot(data_figs, aes(x = prop)) +
  # Make the figure a histogram
  geom_histogram()

# Write figure to a pdf in the 'figures' folder
pdf("figures/name.pdf")
name.plot
# Close pdf call
dev.off()

# Histogram of dependent variable (number of 'Page's) - e based log transform
name_loge.plot = ggplot(data_figs, aes(x = prop_loge)) +
  # Make the figure a histogram
  geom_histogram()

# Write figure to a pdf in the 'figures' folder
pdf("figures/name_loge.pdf")
name_loge.plot
# Close pdf call
dev.off()

# Histogram of dependent variable (number of 'Page's) - 10 based log transform
name_log10.plot = ggplot(data_figs, aes(x = prop_log10)) +
  # Make the figure a histogram
  geom_histogram()

# Write figure to a pdf in the 'figures' folder
pdf("figures/name_log10.pdf")
name_log10.plot
# Close pdf call
dev.off()

# Proportion of 'Page's by year (continuous predictor)
year.plot = ggplot(data_figs, aes(x = year, y = prop_log10)) +
  # Make the figure a scatterplot
  geom_point() +
  # Add a regression line, 'lm' call makes it linear regression
  geom_smooth(method="lm") +
  # Add a title
  ggtitle("Proportion of People with\nthe Name 'Page' Over Time") +
  # Customize the x-axis
  xlab("Year") +
  # Customize the y-axis
  ylab("Proportion of People\n(log base 10 transformed)") +
  # Remove dark background
  theme_classic() +
  # Additional paramaters for displaying plot
  theme(text=element_text(size=18), title=element_text(size=18))

# Write figure to a pdf in the 'figures' folder
pdf("figures/year.pdf")
# Call plot
year.plot
# Close pdf call
dev.off()

# Proportion of 'Page's by sex (categorical predictor)
sex.plot = ggplot(data_figs, aes(x = sex, y = prop_log10)) +
  # Make the figure a boxplot
  geom_boxplot(aes(fill = sex)) +
  # Add a title
  ggtitle("Proportion of People with\nthe Name 'Page' By Sex") +
  # Customize the x-axis
  xlab("Sex") +
  # Customize the y-axis
  ylab("Proportion of People\n(log base 10 transformed)") +
  # Remove dark background
  theme_classic() +
  # Additional paramaters for displaying plot
  theme(text=element_text(size=18), title=element_text(size=18),
        legend.position="none", legend.key=element_blank())

# Write figure to a pdf in the 'figures' folder
pdf("figures/sex.pdf")
# Call plot
sex.plot
# Close pdf call
dev.off()
