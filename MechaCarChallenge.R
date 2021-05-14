library(tidyverse)
mecha_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
summary(mecha_table)
model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_table) #generate multiple linear regression model
summary(model) #generate summary statistics
suspension_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
summary(suspension_table)

total_summary <- suspension_table %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI), SD=sd(PSI)) #create summary table with multiple columns
summary(total_summary)

lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))#create summary table with multiple columns
summary(lot_summary)

t.test(suspension_table$PSI,mu=1500) #compare sample versus population means

t.test(subset(suspension_table, Manufacturing_Lot == 'Lot1')$PSI, mu=1500) #filter by Lot 
t.test(subset(suspension_table, Manufacturing_Lot == 'Lot2')$PSI, mu=1500) #filter by Lot 
t.test(subset(suspension_table, Manufacturing_Lot == 'Lot3')$PSI, mu=1500) #filter by Lot 
