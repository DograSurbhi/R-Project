rm(list=ls())
library(Hmisc)

data2 <- read.csv("C:/Users/dogra/Downloads/datasets_494724_994000_COVID19_line_list_data.csv")
 
describe(data2)

#cleaned up death column
data2$death_dummy <- as.integer(data2$death !=0)

#death rate
sum(data2$death_dummy)/nrow(data2)


#AGE
#claim: people who die are older
dead = subset(data2,death_dummy==1)
alive = subset(data2,death_dummy==0)

mean(dead$age,na.rm = TRUE)
mean(alive$age,na.rm = TRUE)

#The difference between dead and alive in age is 20 Years, Is this statistically correct?

t.test(alive$age, dead$age, alternative = "two.sided", conf.level = 0.99)

#When p-value is less than 0.05 , we reject the null hypothesis .Here p-value~ 0 so we reject
#the hypothesis and conclude that the hypothesis is statistically correct.

#Gender
#claim:gender has no effect?
men = subset(data2, gender=="male")
women = subset(data2, gender=="female")

mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)
#men has more death rates.
#is this statistically correct?
t.test(men$death_dummy, women$death_dummy, alternative = "two.sided", conf.level = 0.99)
#99%confidence that  men have from 0.8% to 8.8% higher chance of dying.
#p-value is much less than 0.5 so we can reject the hypothesis and say that this fact is 
#statistically correct.