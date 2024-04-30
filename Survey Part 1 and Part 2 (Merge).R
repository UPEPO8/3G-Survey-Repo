library(dplyr)
library(ggplot2)
library(readr)
library(tibble)

generativeAI <- read_csv("C:/R Codes/The Use of Generative AI for Students.csv")
as_tibble(generativeAI)

generativeAI2 <- generativeAI

generativeAI2 <- generativeAI[,-5] #remove not useful column 

View(generativeAI2)

#factor sex
factor_sex <- factor(generativeAI2$Sex, levels = c("Male", "Female")) 
factor_sex <- as.integer(factor_sex)

#factor age
factor_age <- factor(generativeAI2$`Age:`, levels = c("Under 18", "18-24", "25-34", "35 and above"))
factor_age <- as.integer(factor_age)

#factor educational level
factor_educ_level <- factor(generativeAI2$`Education level:`, levels = c("High school or lower",
                                                                         "Some college or vocational training",
                                                                         "Bachelor's degree",
                                                                         "Master's degree",
                                                                         "Doctoral degree"))
factor_educ_level <- as.integer(factor_educ_level)


familarity_mean <- mean(generativeAI2$`Familiarity with AI Technology`)

#factoring frequency of usage of AI 
factor_frequency_use <- factor(generativeAI2$`How often do you use generative AI?`, 
                               levels = c("Several times a day",
                                          "Once a day",
                                          "Several times a week",
                                          "Once a week",
                                          "Less often"))
factor_frequency_use <- as.integer(factor_frequency_use)



perf_expect_cols <- generativeAI2[, 9:12]
mean_expect_cols <- colMeans(perf_expect_cols)
perf_expect_cols <- as.data.frame(mean_expect_cols)
perf_expect_cols$total_mean <- mean(mean_expect_cols)
perf_expect_cols$standard_deviation <- sapply(perf_expect_cols, sd)
View(perf_expect_cols)






#Read the CSV
survey <- read.csv("C:/R Codes/The Use of Generative AI for Students.csv")
surveyQ <- read.csv("C:/R Codes/The Use of Generative AI for Students.csv", header = FALSE)
surveyQ <- surveyQ[-5]
View(surveyQ)
View(survey)

survey <- survey[-5]

View(survey)
#Make it a table
surveyDF <- as_tibble(survey)




#Effort Expectancy
surveyEAOG <- surveyDF[13:16]


#Calculate the mean of each Column
surveyEA <- colMeans(surveyEAOG)
surveyEA <- tibble(surveyEA)

#Calculate SD of each column
surveyEA <- mutate(surveyEA, SD = sapply(surveyEAOG, sd))

#Renaming the Columns
colnames(surveyEA) <- c("Mean", "SD")
labelEA <- as.vector(unlist(surveyQ[1, 13:16]))

surveyEA <- cbind(labelEA, surveyEA)
colnames(surveyEA)[1] <- "Effort Expectancy"

View(surveyEA)



#Attitude toward using technology
surveyATOG <- surveyDF[17:20]
View(surveyATOG)

#Calculate the mean of each Column
surveyAT <- colMeans(surveyATOG)
surveyAT <- tibble(surveyAT)

#Calculate SD of each column
surveyAT <- mutate(surveyAT, SD = sapply(surveyATOG, sd))

#Renaming the Columns
colnames(surveyAT) <- c("Mean", "SD")
labelAT <- as.vector(unlist(surveyQ[1, 17:20]))
surveyAT <- cbind(labelAT, surveyAT)
colnames(surveyAT)[1] <- "Facilitating Conditions"

#View the table
View(surveyAT)




#Social Influence
surveySIOG <- surveyDF[21:24]
View(surveySIOG)

#Calculate the mean of each Column
surveySI <- colMeans(surveySIOG)
surveySI <- tibble(surveySI)

#Calculate SD of each column
surveySI <- mutate(surveySI, SD = sapply(surveySIOG, sd))

#Renaming the Columns
colnames(surveySI) <- c("Mean", "SD")
labelSI <- as.vector(unlist(surveyQ[1, 21:24]))
surveySI <- cbind(labelSI, surveySI)
colnames(surveySI)[1] <- "Facilitating Conditions"

#View the table
View(surveySI)






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
labelFC <- as.vector(unlist(surveyQ[1, 25:28]))
surveyFC <- cbind(labelFC, surveyFC)
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
labelBI <- as.vector(unlist(surveyQ[1, 37:39]))
surveyBI <- cbind(labelBI, surveyBI)
colnames(surveyBI)[1] <- "Behavioral Intention"

View(surveyBI)



#Whole Survey

surveyALLOG <- surveyDF[9:39]
View(surveyALLOG)

#Calculate the mean of each Column
surveyALL <- colMeans(surveyALLOG)
surveyALL <- tibble(surveyALL)

#Calculate SD of each column
surveyALL <- mutate(surveyALL, SD = sapply(surveyALLOG, sd))

#Renaming the Columns
colnames(surveyALL) <- c("Mean", "SD")
labelALL <- as.vector(unlist(surveyQ[1, 9:39]))
surveyALL <- cbind(labelALL, surveyALL)
colnames(surveyALL)[1] <- "Whole Survey"

#View the table
View(surveyALL)

