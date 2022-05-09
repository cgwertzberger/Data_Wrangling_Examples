#Wertzberger_Homework3
#10/17/21
#Chase Wertzberger

rm(list = ls())

#Problem 1
chess <- read.csv("chess.csv", stringsAsFactors = T, na.strings = c("","unknown","n/a"))
str(chess)
View(chess)

#Problem 2
chess$Player<- as.character(chess$Player)
chess$Status <- gsub("A", "Active", chess$Status)
chess$Status <- gsub("Activective", "Active", chess$Status)
chess$Status<- as.factor(chess$Status)
str(chess)

#Problem 3
chess_nas<- colSums(is.na(chess))
class(chess_nas)
chess_nas
?aggregate
status_rating<- aggregate(chess$Rapid, by = list(chess$Status), FUN = median, na.rm = T)
status_rating
chess$Rapid2 <- chess$Rapid
chess[chess$Status=="Active" & is.na(chess$Rapid2), "Rapid2"] <- status_rating[1,2]
chess[chess$Status=="Inactive" & is.na(chess$Rapid2), "Rapid2"] <- status_rating[2,2]
View(chess)

#Problem 4
library(scales)
chess$Rating2 <- rescale(chess$Rating, to = c(1,10))
chess$Age <- ifelse(chess$Birth > 2003,"Junior", ifelse(chess$Birth > 1986,"Young", ifelse(chess$Birth > 1956,"Middle-Age","Senior")))
View(chess)
#Use view to check df



