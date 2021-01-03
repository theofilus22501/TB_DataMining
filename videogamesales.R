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
