
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

url <- "https://catalog.data.gov/dataset/supply-chain-greenhouse-gas-emission-factors-v1-2-by-naics-6/resource/fbc78d3c-49bd-40c0-9dac-2ed16c07a305"

SupplyData <- read.csv("SupplyChainGHGEmissionFactors_v1.2_NAICS_byGHG_USD2021.csv")


# BEGIN SOLUTION
q1 <- NULL
