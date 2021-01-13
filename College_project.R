library(tidyverse)

library(dplyr)

library(fivethirtyeight)

#to view all the data in the college_all_ages dataset
view(college_all_ages)
#to view the description of each variable in this dataset 
help(college_all_ages)
 
college <- college_all_ages
#suppress scientific notation
options(scipen = 10000)

#Question 1 
ggplot(data = college)+ 
  geom_density(mapping = aes(x = median, weight = total), fill = "plum", alpha = 0.3, colour = "plum")+
  labs(x = "Median Salary",
       y = "Density")+ 
  theme_gray()+
  ggtitle("Total distribution of salaries")+
  theme(plot.title = element_text(hjust = 0.5))

#Question 2
#using slice_max function to select the highest salaries 
 
highest_salaries <- slice_max(college_all_ages, order_by = median, n = 10, with_ties = TRUE)

ggplot(data = highest_salaries)+
  geom_col(mapping = aes(x = reorder(major, - median),y = median, fill = major), width = 0.65, show.legend = FALSE)+
  theme(axis.text.x = element_text(angle = 60, hjust = 1, vjust = 1, size = 8.15))+
  ggtitle("Top 10 highest salaries ranked by major")+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x = "Majors",
       y = "Median salary")

#Question 3
ggplot(data = highest_salaries)+
  geom_col(mapping = aes(x = reorder(major, - median),y = median, fill = major), width = 0.65, show.legend = FALSE)+
  theme(axis.text.x = element_text(angle = 60, hjust = 1, vjust = 1, size = 8.15))+
  ggtitle("Top 10 highest salaries ranked by major")+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x = "Majors",
       y = "Median salary")+
  geom_text(aes(x = major, y = median, label = total), position = position_dodge(width = 0.9),vjust = -0.05, size = 3)
  
           