lokasi_kerja <- "D:/data"
getwd()
setwd(lokasi_kerja)
getwd()

dataset <- read.csv("videogamesales.csv", sep = ";")
head(dataset)

library(arules)
library(arulesViz)
library(C50)
library(printr)

dataset <- read.transactions("videogamesales.csv", sep = ",")
inspect(dataset)

rules<- apriori(dataset, parameter = list(support = 0.2, confidence = 0.6))
inspect(rules)
arulesViz::plotly_arules(rules)

cor(dataset$NA_Sales, dataset$Other_Sales)
cor(dataset$NA_Sales, dataset$Year)
cor(dataset$Other_Sales, dataset$Year)

databaru.NA_Sales <-data.frame( NA_Sales = c(1))
databaru.Other_Sales <-data.frame( Other_Sales = c(12))

class(dataset)
class(dataset$NA_Sales)
class(dataset$Other_Sales)

dataset$NA_Sales <- as.factor(dataset$NA_Sales)
dataset$Other_Sales <- as.factor(dataset$Other_Sales)

model <- C5.0(NA_Sales ~., data=dataset)
model
summary(model)

model <- C5.0(Other_Sales ~., data=dataset)
model
summary(model)

plot(model)

datatesting <- dataset[,1:4]

predictions <- predict(model, datatesting)
table(predictions, dataset$NA_Sales)
table(predictions, dataset$Other_Sales)


