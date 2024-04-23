library(dplyr)
library(ggplot2)
library(readr)

generativeAI <- read_csv("The Use of Generative AI for Students.csv")
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


  


