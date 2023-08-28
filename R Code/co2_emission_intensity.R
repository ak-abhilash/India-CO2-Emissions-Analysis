library(ggplot2)

# Replace with your file paths
file_path_co2 <- 'C:/Users/91910/Downloads/India_CO2_1996_2020.csv'
file_path_economy <- 'C:/Users/91910/Downloads/economy_india.csv'

# Load the CSV files into DataFrames
df_co2 <- read.csv(file_path_co2, header = FALSE)
df_economy <- read.csv(file_path_economy, header = FALSE)

# Combine CO2 and GDP data into a single data frame
data <- data.frame(
  Year = as.numeric(df_co2[1, 2:ncol(df_co2)]),
  CO2_Emissions = as.numeric(df_co2[2, 2:ncol(df_co2)]),
  GDP = as.numeric(df_economy[2, 2:ncol(df_economy)])
)

# Calculate CO2 emission intensity
data$CO2_Emission_Intensity <- data$CO2_Emissions / data$GDP

# Plot the CO2 emission intensity over time
ggplot(data, aes(x = Year, y = CO2_Emission_Intensity)) +
  geom_line(color = 'purple', size = 1) +
  geom_point(color = 'purple', size = 3) +
  labs(x = 'Year', y = 'CO2 Emission Intensity (MT/Person)', title = 'CO2 Emission Intensity Over Time in India') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_x_continuous(breaks = seq(1996, 2020, by = 2))