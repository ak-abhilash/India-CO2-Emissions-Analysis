# Load required library
library(readr)

# Replace the file paths with the correct paths on your PC
file_path_co2 <- 'C:/Users/91910/Downloads/India_CO2_1996_2020.csv'
file_path_economy <- 'C:/Users/91910/Downloads/economy_india.csv'

# Load the CSV files into data frames
df_co2 <- read_csv(file_path_co2, col_names = FALSE)
df_economy <- read_csv(file_path_economy, col_names = FALSE)

# Get the CO2 data and GDP data
co2_data <- df_co2[2, -1]
gdp_data <- df_economy[2, -1]

# Convert the data to numeric
co2_data <- as.numeric(co2_data)
gdp_data <- as.numeric(gdp_data)

# Calculate the correlation coefficient
correlation_coefficient <- cor(co2_data, gdp_data, use = "complete.obs")

cat("Correlation Coefficient between CO2 Emissions and GDP:", correlation_coefficient, "\n")


#Correlation Coefficient between CO2 Emissions and GDP: 0.9893925

#The correlation coefficient obtained is 0.989, which is close to 1. This indicates a very strong positive correlation between CO2 emissions (measured in metric tons, MT) and GDP (measured in billions of dollars) in India. The high correlation value suggests that as the country's GDP grows, CO2 emissions tend to increase proportionally. However, it is important to note that correlation does not imply causation. Further analysis is required to understand the underlying factors influencing this relationship.