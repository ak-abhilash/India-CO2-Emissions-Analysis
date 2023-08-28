# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Load the CSV file into a DataFrame
file_path <- "C:/Users/91910/Downloads/countries_data.csv"
df <- read.csv(file_path, row.names=1)

# Get the top 10 countries with the highest CO2 emissions in 2020
top_10_countries <- df %>%
  arrange(desc(`X2020`)) %>%
  head(10)

# Reshape the data for plotting
df_long <- top_10_countries %>%
  add_rownames("Country") %>%
  pivot_longer(cols = starts_with("X"), names_to = "Year", values_to = "CO2") %>%
  mutate(Year = as.numeric(gsub("X", "", Year)))  # Convert Year to numeric

# Plot the graph
ggplot(df_long, aes(x=Year, y=CO2, color=Country, group=Country)) +
  geom_line() +
  geom_point(size=3) +  # Adjust the size of the points
  labs(x='Year', y='CO2 Emissions (MT)', title='Top 10 Countries with the Highest CO2 Emissions (1996-2020)') +
  scale_x_continuous(breaks = seq(1996, 2020, by = 4)) +  # Adjust the breaks
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_color_discrete(name = "Country") +
  guides(color = guide_legend(title = NULL)) +
  theme(legend.position="bottom") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.title = element_blank()) +
  theme(legend.text = element_text(size=10)) +
  theme(axis.title = element_text(size=12))
