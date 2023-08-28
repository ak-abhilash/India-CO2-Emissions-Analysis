# Load required libraries
library(ggplot2)
library(dplyr)

file_path <- 'C:/Users/91910/Downloads/economy_india.csv'

# Load the CSV file into a DataFrame
df <- read.csv(file_path, header = TRUE, stringsAsFactors = FALSE)

# Use the first row for CO2 data
economy_data <- df[1, -1]

# Convert CO2 data to numeric, replacing non-numeric values with NA
economy_data <- as.numeric(economy_data)
economy_data[economy_data == 0] <- NA

# Create a data frame for plotting
plot_data <- data.frame(
  Year = as.numeric(gsub("X", "", names(df)[-1])),
  Economy = economy_data
)

# Plot the graph using ggplot2
ggplot(plot_data, aes(x = Year, y = Economy)) +
  geom_line(color = 'red', linetype = 'solid', size = 1) +
  geom_point(color = 'red', shape = 19, size = 3) +
  labs(x = 'Year', y = 'GDP Figures (In Billion)', title = 'GDP Figures of India (1996-2020)') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.text.y = element_text(color = 'black')) +
  scale_x_continuous(breaks = seq(1996, 2020, by = 4)) +
  scale_y_continuous(breaks = seq(0, max(plot_data$Economy), by = 500))