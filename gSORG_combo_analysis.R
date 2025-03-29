# Messing around with tidy data for gSORG analysis

# Create data
library(tidyverse)

# Create a wide format dataset with replicates for each drug concentration and genotype
drug_data <- tibble(
  Genotype = c(rep("Genotype_A", 3), rep("Genotype_B", 3), rep("Genotype_C", 3)),
  Drug = rep("Drug_X", 9),
  Concentration = rep(c("Low", "Medium", "High"), 3),
  Rep1 = c(10, 20, 30, 15, 25, 35, 5, 15, 25),
  Rep2 = c(12, 19, 31, 14, 24, 34, 6, 16, 26),
  Rep3 = c(11, 21, 29, 13, 26, 36, 7, 17, 27)
)

# View the wide-format data
print(drug_data)

# Convert to tidy
# Convert the wide-format data to tidy format
tidy_drug_data <- drug_data %>%
  pivot_longer(cols = starts_with("Rep"),  # Pivot the Rep1, Rep2, Rep3 columns
               names_to = "Replicate",     # New column for replicate names
               values_to = "Response")     # New column for response values

# View the tidy data
print(tidy_drug_data)

# Plot the responses by drug and concentration, colored by genotype
ggplot(tidy_drug_data, aes(x = Concentration, y = Response, color = Genotype)) +
  geom_point(aes(shape = Replicate), size = 3) +   # Plot points for each replicate
  geom_line(aes(group = interaction(Genotype, Replicate)), linetype = "dashed") +  # Connect points for each replicate
  facet_wrap(~ Drug) +  # Facet by drug
  labs(title = "Drug Response by Genotype and Concentration", 
       x = "Concentration", y = "Response") +
  theme_minimal()

# Summarise data

# Assume `tidy_drug_data` is the tidy dataset you obtained earlier

# Summarize data to calculate mean and SEM for each genotype, drug, and concentration combination
summary_data <- tidy_drug_data %>%
  group_by(Genotype, Drug, Concentration) %>%
  summarize(
    Mean_Response = mean(Response),  # Calculate the mean response
    SEM = sd(Response) / sqrt(n())   # Calculate the standard error of the mean (SEM)
  ) %>%
  ungroup()

# View the summarized data
print(summary_data)

# Plot the summarized data with error bars for SEM
ggplot(summary_data, aes(x = Concentration, y = Mean_Response, color = Genotype)) +
  geom_point(size = 3) +   # Plot points for the mean response
  geom_line(aes(group = Genotype)) +  # Connect points with lines for each genotype
  geom_errorbar(aes(ymin = Mean_Response - SEM, ymax = Mean_Response + SEM), 
                width = 0.2) +  # Add error bars for SEM
  facet_wrap(~ Drug) +  # Facet by drug
  labs(title = "Mean Drug Response by Genotype and Concentration", 
       x = "Concentration", y = "Mean Response") +
  theme_minimal()

