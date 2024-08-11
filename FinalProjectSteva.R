
  "title:  'Casey Steva Final Project'
subtitle: 'INFO 523'
author:
  - name: Student -  [Casey Steva]
affiliation: [University of Arizona, Grad Student]
- name: Instructor -  Cristian Román-Palacios
affiliation: School of Information, University of Arizona, Tucson, AZ"



  
  ### Objectives
  #This Final Project focuses on Geopolitical data using CART 


  
  #### Additional resources relevant to this Final
#Data was obtained from https://catalog.data.gov/dataset/supply-chain-greenhouse-gas-emission-factors-v1-2-by-naics-6/resource/fbc78d3c-49bd-40c0-9dac-2ed16c07a305
#Dataset called ""SupplyChainGHGEmissionFactors_v1.2_NAICS_byGHG_USD2021.csv"
#install.packages("rpart")
#install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
library(readr)
library(dplyr)

url <- "https://catalog.data.gov/dataset/supply-chain-greenhouse-gas-emission-factors-v1-2-by-naics-6/resource/fbc78d3c-49bd-40c0-9dac-2ed16c07a305"

SupplyData <- read.csv("SupplyChainGHGEmissionFactors_v1.2_NAICS_byGHG_USD2021.csv")

str(SupplyData)
summary(SupplyData)
colnames(SupplyData)
#Select Relevance and Clean Data

SelectedData <- SupplyData %>%
  #select("2017 NAICS Code ", "GHG", "Unit")
  #select("X2017.NAICS.Code", "X2017.NAICS.Title", "GHG", "Unit", "Supply.Chain.Emission.Factors.without.Margins", "Margins.of.Supply.Chain.Emission.Factors", "Supply.Chain.Emission.Factors.with.Margins", "Reference.USEEIO.Code")
  select("X2017.NAICS.Code","Supply.Chain.Emission.Factors.without.Margins", "Margins.of.Supply.Chain.Emission.Factors", "Supply.Chain.Emission.Factors.with.Margins", "Reference.USEEIO.Code")
# missing data

SelectedData <- na.omit(SelectedData)

#Split Data for training and testing

set.seed(123) #want to reproduce this

TrainIndex <- sample(1:nrow(SelectedData), 0.7 * nrow(SelectedData))
TrainData <- SelectedData[TrainIndex, ]
TestData <- SelectedData[-TrainIndex, ]

#Build CART Model

ModelCart <- rpart(Supply.Chain.Emission.Factors.with.Margins ~ 
                     Supply.Chain.Emission.Factors.without.Margins + 
                     Margins.of.Supply.Chain.Emission.Factors, 
                   data = TrainData, method = "anova")


#Tree structure of Data/ Visual of Data Tree

rpart.plot(ModelCart)


#evalute the model

Predict <- predict(ModelCart, TestData)

#Calculate Root Means squared

X <- TestData$Supply.Chain.Emission.Factors.with.Margins
RMSE <- sqrt(mean((Predict - X)^2))

