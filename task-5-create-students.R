
# Number of students
n = 30

# Seed and shuffle students
library(permute)
set.seed(123)

# List of Studentnames
studentnames <- paste(rep("student",n),shuffle(1:1:n), sep= "_")

# Types of cards
type_cards <- c("clubs", "spades", "hearts", "diamonds")

# DF for assignment
a <- ceiling(length(studentnames) / length(type_cards))
b <- cards <- c(rep("clubs", a), rep("spades", a), rep("hearts", a), rep("diamonds", a))
c <- rep(c("black", "red"), length(b)/2)
d <- c(studentnames, rep(NA,length(c) - length(studentnames)))

df_assignment <- cbind(b,c,d)

# Now we rearrange the NA (all in the last group and we distribute them equally to groups)
# List where each element is a group of type_cards
list_groups <- list()
for (i in 1:length(type_cards)){
  list_groups[[i]] <- df_assignment[which(df_assignment[,1] == type_cards[i]),]
}
names(list_groups) <- type_cards

# We rearrange NA between groups to get groups of equal size
if (length(is.na(list_groups[[4]][,3])) > 1){
  for (i in 1:(length(which(is.na(list_groups[[4]][,3])== T))-1)){
    
    if(is.na(list_groups[[4]][(nrow(list_groups[[4]])+1-i),3])){
    list_groups[[4]][(nrow(list_groups[[4]])+1-i),3] <- list_groups[[i]] [i+1,3]
    list_groups[[i]][i+1,3] <- NA
    } else {print("all good")}
  }
} else {print("all good")}

list_groups

