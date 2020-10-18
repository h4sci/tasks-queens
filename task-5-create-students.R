
# Number of students
n = 30

# Seed and shuffle students
library(permute)
set.seed(123)

# List of Studentnames
studentnames <- paste(rep("student",n),shuffle(1:1:n), sep= "_")
