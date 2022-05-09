#wertzberger_Homework1
#Chase Wertzberger
#9/09/21

rm(list = ls())

# Question 1
a <- 8
heart <- a^2 + pi * (a/2)^2
heart

# Question 2
valentinesdata <- c(93.24,9.78,6.94,52,101.21,14.69,12.21,68.2)
valentines <- matrix(valentinesdata, nrow = 2, ncol = 4, byrow = TRUE)
rownames(valentines) <- c("2019", "2020")
colnames(valentines) <- c("Partner", "Friend", "Pet", "Other")
valentines

year_total <- rowSums(valentines)
year_total

pets_2019 <- valentines["2019","Pet"]
pets_2020 <- valentines["2020","Pet"]

pet_change <- (pets_2020-pets_2019)/pets_2019*100
pet_change

#Question 3
library(mosaicData)

data(Marriage)

View(Marriage)

app_date_sorted <- Marriage[order(Marriage$appdate),]
View(app_date_sorted)
days<- max(app_date_sorted$appdate, na.rm=TRUE) - min(app_date_sorted$appdate, na.rm=TRUE)
days

minors<- Marriage[Marriage$age>18, c("age")]
minors

divorced_grooms <- subset(Marriage, Marriage$person == "Groom" & Marriage$prevconc == "Divorce")
divorced_grooms
View(divorced_grooms)
