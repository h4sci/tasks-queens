# Queens: Task4 

library("dplyr")
library("tidyverse")

# Load data (separated by semicolon)
data_survey <- read.csv("intro-survey.csv", sep=";")
View(data_survey)


# --------------------------------------------
# Part1: Descriptive statistics
# --------------------------------------------

# How many students participated in survey
number_participants <- length(unique(data_survey$id))
number_groups <- length(unique(data_survey$cgroup))

# Summary statistics for each answer
numerical_variables <- colnames(data_survey)[-c(1,2,21,22)]
descriptive_stats <- summary(data_survey[,numerical_variables])


# --------------------------------------------
# Part2: Figures
# --------------------------------------------
library(ggplot2)
library(reshape2)


# Long form
data_survey_melted <- melt(data_survey[,-c(2,21)], id.vars=c("id", "cgroup"))

# Barplot
plot_overview <- ggplot(data=data_survey_melted, aes(x=factor(value), fill=cgroup))+
  labs(x="answer")+
  geom_bar()+
  facet_grid(. ~ variable)


# Barcharts on some programming languages:

ggplot(data = data_survey) + 
  geom_bar(mapping = aes(x = l_r)) +
  labs(title="R", x="level") 

ggplot(data = data_survey) + 
  geom_bar(mapping = aes(x = l_python)) +
  labs(title="Python", x="level") 

# --------------------------------------------
# End
# --------------------------------------------