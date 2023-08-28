# Load required libraries
library(readr)
library(stats)

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

# Perform regression analysis to predict CO2 emissions based on GDP
X <- cbind(1, gdp_data)  # Adding a constant term for the intercept
model_co2 <- lm(co2_data ~ X)
co2_predicted <- predict(model_co2, newdata = data.frame(X))

# Perform regression analysis to predict GDP based on CO2 emissions
X <- cbind(1, co2_data)  # Adding a constant term for the intercept
model_gdp <- lm(gdp_data ~ X)
gdp_predicted <- predict(model_gdp, newdata = data.frame(X))

# Print the summary of the regression models
cat("CO2 Emissions Prediction based on GDP:\n")
summary(model_co2)

cat("\nGDP Prediction based on CO2 Emissions:\n")
summary(model_gdp)