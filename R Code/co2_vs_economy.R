# Load required libraries
library(ggplot2)
library(dplyr)

file_path_co2 <- 'C:/Users/91910/Downloads/India_CO2_1996_2020.csv'
file_path_economy <- 'C:/Users/91910/Downloads/economy_india.csv'

# Load the CSV files into DataFrames
df_co2 <- read.csv(file_path_co2, header = FALSE)
df_economy <- read.csv(file_path_economy, header = FALSE)

# Get the years and CO2 data
years_co2 <- as.numeric(unlist(df_co2[1, -1]))
co2_data <- as.numeric(unlist(df_co2[2, -1]))

# Get the years and GDP data
years_gdp <- as.numeric(unlist(df_economy[1, -1]))
gdp_data <- as.numeric(unlist(df_economy[2, -1]))

# Plot the CO2 emissions data
ggplot() +
  geom_line(data = data.frame(Year = years_co2, CO2_Emissions = co2_data), aes(x = Year, y = CO2_Emissions), color = 'blue') +
  geom_point(data = data.frame(Year = years_co2, CO2_Emissions = co2_data), aes(x = Year, y = CO2_Emissions), color = 'blue', size = 3) +
  geom_line(data = data.frame(Year = years_gdp, GDP_Figures = gdp_data), aes(x = Year, y = GDP_Figures), color = 'red') +
  geom_point(data = data.frame(Year = years_gdp, GDP_Figures = gdp_data), aes(x = Year, y = GDP_Figures), color = 'red', size = 3) +
  labs(x = 'Year', y = 'CO2 Emissions (MT)', title = 'Comparison of CO2 Emissions and GDP Figures in India (1996-2020)') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_x_continuous(breaks = seq(1996, 2020, by = 2)) +
  scale_y_continuous(breaks = seq(0, 3000, by = 250), labels = function(x) paste(x, "K", sep = "")) +
  scale_y_continuous(sec.axis = sec_axis(~.*1, name = 'GDP Figures (In Billions)', breaks = seq(0, 4000, by = 500)))