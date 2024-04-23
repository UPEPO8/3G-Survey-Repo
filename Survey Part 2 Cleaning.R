install.packages("readxl")
library(readxl)
library(tibble)
library(dplyr)

#Read the CSV
survey <- read.csv("C:/Users/UPEPO/Desktop/Survey/survey.csv")
View(survey)

#Make it a table
surveyDF <- as_tibble(survey)
View(surveyDF)

View(surveyDF)

#Facilitating Conditions Range
surveyFCOG<- surveyDF[25:28]
view(surveyFCOG)

#Calculate the mean of each Column
surveyFC <- colMeans(surveyFCOG)
surveyFC <- tibble(surveyFC)

#Calculate SD of each column
surveyFC <- mutate(surveyFC, SD = sapply(surveyFCOG, sd))

#Renaming the Columns
colnames(surveyFC) <- c("Mean", "SD")
label <- c( "I have the resources necessary to use Generative AI for my studies.","I have the knowledge necessary to use Generative AI.","Generative AI is compatible with other systems I use.","A specific person or group is available to assist me with using Generative AI if I encounter difficulties.")
surveyFC <- cbind(label, surveyFC)
colnames(surveyFC)[1] <- "Facilitating Conditions"

#View the table
View(surveyFC)



#Usage Range
surveyBIOG <- surveyDF[37:39]
View(surveyBIOG)

#Calculate the mean of each Column
surveyBI <- colMeans(surveyBIOG)
surveyBI <- tibble(surveyBI)




#Calculate SD of each column
surveyBI <- mutate(surveyBI, SD = sapply(surveyBIOG , sd))
View(surveyBI)
colnames(surveyBI)[1] <- "Mean"
labelsBI <- c("I intend to use Generative AI for my studies in the next few months.", "I predict I would use Generative AI for my studies in the next few months.", "I plan to use Generative AI for my studies in the next few months.")
surveyBI <- cbind(labelsBI, surveyBI)
colnames(surveyBI)[1] <- "Behavioral Intention"

View(surveyBI)