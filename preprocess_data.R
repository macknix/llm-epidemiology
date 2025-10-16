# imports

# data cleaning steps

# Define the input and output filenames
filename <- "sample_data.tab"
output_filename <- paste0("clean_", filename)

# Read the data
data <- read.table(filename, header = TRUE, sep = "\t")

# Rename the column
colnames(data)[colnames(data) == "W9CLENDYR"] <- "economic_activity_end_year"

# Handle missing values
# Replace SPSS missing value codes with NA
data$economic_activity_end_year[data$economic_activity_end_year %in% c(-9, -8, -3, -1)] <- NA

# Convert to numeric
data$economic_activity_end_year <- as.numeric(data$economic_activity_end_year)

# Save the cleaned data
write.table(data, output_filename, sep = "\t", row.names = FALSE, quote = FALSE)

