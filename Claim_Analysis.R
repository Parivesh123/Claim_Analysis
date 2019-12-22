setwd("D:/Python and R/R")
df<-read.csv("Claims_Sample.csv",stringsAsFactors = F, header=T)
summary(df)

df$LA_OCCUPATION = factor(df$LA_OCCUPATION,
                          levels=c('Business Owner','Professional','Self Employed','Agriculturist','Salaried','Housewife','Unemployed','Retired/Pensioner','Student','NULL'),
                          labels=c(1,2,3,4,5,6,7,8,9,10))

library('caTools')
set.seed(123)
split = sample.split(df$LA_Income, SplitRatio = 0.8)
training_set = subset(df,split == TRUE)
test_set= subset(df,split ==FALSE)

regressor = lm(formula = LA_Income ~ LA_OCCUPATION, data = training_set)
Classifier = glm(formula = LA_Income ~ LA_OCCUPATION,
                 family= binomial(),
                 data=training_set)
