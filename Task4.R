# Queens: Task 

# Load data (separated by semicolon)
data <- read.csv("intro-survey.csv", sep=";")
View(data)

# --------------------------------------------
# Part1: Descriptive statistics
# --------------------------------------------

# How many students participated in survey
number_participants <- length(unique(data$id))

# Summary statistics for each answer
numerical_variables <- colnames(data)[-c(1,2,21,22)]
summary(data[,numerical_variables])
