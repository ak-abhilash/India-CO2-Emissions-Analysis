file_path <- 'C:/Users/91910/Downloads/India_CO2_1996_2020.csv'

# Load required libraries
library(ggplot2)
library(dplyr)

# Load the CSV file into a DataFrame
df <- read.csv(file_path, header = TRUE, stringsAsFactors = FALSE)

# Convert CO2 data to numeric and replace non-numeric values with NA
co2_data <- as.numeric(df[1, -1])
co2_data[co2_data == 0] <- NA

# Create a data frame for plotting
plot_data <- data.frame(
  Year = as.numeric(sub("X", "", names(df)[-1])),
  CO2_Emissions = co2_data
)

# Plot the line graph using ggplot2
ggplot(plot_data, aes(x = Year, y = CO2_Emissions)) +
  geom_line(color = 'blue', size = 1.2) +
  geom_point(shape = 19, size = 3, color = 'blue') +
  labs(x = 'Year', y = 'CO2 Emissions (MT)', title = 'Carbon Emissions in India (1996-2020)') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_x_continuous(breaks = seq(1996, 2020, by = 4)) +
  scale_y_continuous(limits = c(500, NA), breaks = seq(500, max(plot_data$CO2_Emissions, na.rm = TRUE) + 500, by = 500))