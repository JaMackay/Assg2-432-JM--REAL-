#Assignment 2 - Jamie MacKay

#load readr and dplyr libraries and the Fallopia dataset
library(readr)
library(dplyr)
Fallo <- read_csv("InData.csv")

#change dataset containing all rows with total biomass > 60
Fallo <- filter(Fallo, Total > 60)

#change dataset with 4 desired columns
Fallo <- select(Fallo, Total, Taxon, Scenario, Nutrients)

#convert total biomass to 'grams' and change header accordingly
Fallo <- mutate(Fallo, Total = Total/1000) 
names(Fallo)[1] <- 'TotalG'

#change nutrients column to first letter of each category
Fallo$Nutrients <- gsub('(\\w)\\w+', '\\1', Fallo$Nutrients)

#convert all periods within TotalG column to commas
Fallo$TotalG <- gsub('\\.',',',Fallo$TotalG)
