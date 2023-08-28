library(ggplot2)

file_path_co2 <- 'C:/Users/91910/Downloads/India_CO2_1996_2020.csv'
file_path_economy <- 'C:/Users/91910/Downloads/economy_india.csv'
file_path_population <- 'C:/Users/91910/Downloads/population_india.csv'

# Read the CSV files into data frames
df_co2 <- read.csv(file_path_co2, header = FALSE)
df_economy <- read.csv(file_path_economy, header = FALSE)
df_population <- read.csv(file_path_population, header = FALSE)

# Extract years and data
years <- as.numeric(df_co2[1, -1])
co2_data <- as.numeric(df_co2[2, -1])
gdp_data <- as.numeric(df_economy[2, -1])
population_data <- as.numeric(df_population[2, 1])

# Calculate per capita emissions and per capita GDP
per_capita_co2 <- co2_data / population_data
per_capita_gdp <- gdp_data / population_data

# Create a data frame to store the results
per_capita_df <- data.frame(
  Year = years,
  Per_Capita_CO2_Emissions_MT_Person = per_capita_co2,
  Per_Capita_GDP_Billion_USD_Person = per_capita_gdp
)

# Create the dual y-axis plot
plot <- ggplot(per_capita_df) +
  geom_line(aes(x = Year, y = Per_Capita_CO2_Emissions_MT_Person, color = 'CO2 Emissions'), size = 1.5) +
  geom_line(aes(x = Year, y = Per_Capita_GDP_Billion_USD_Person, color = 'GDP'), size = 1.5) +
  scale_y_continuous(
    name = "Per Capita CO2 Emissions (MT/Person)",
    limits = c(100, NA),
    breaks = seq(100, max(per_capita_co2), by = 200)
  ) +
  scale_y_continuous(
    sec.axis = sec_axis(trans = ~ . + 100, name = "Per Capita GDP (USD/Person)"),
    name = "Per Capita CO2 Emissions (KG/Person)",
    limits = c(100, NA),
    breaks = seq(300, max(per_capita_gdp) + 500, by = 500)
  ) +
  scale_x_continuous(breaks = seq(1996, 2020, by = 4)) +
  scale_color_manual(values = c('CO2 Emissions' = 'purple', 'GDP' = 'red')) +
  labs(
    x = 'Years',
    title = 'Per Capita CO2 Emissions and GDP of India (1996-2020)',
    color = NULL  # Removing the color legend title
  ) +
  theme_minimal()

print(plot)