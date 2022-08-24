# working  with catergorical data in R 
### make sure to install all the packages below. 
install.packages("tidyverse")
pacman::p_load(pacman, tidyverse, vcd)
library(tidyverse)
 ### Arthritis dataset (Double blind clinical dataset)
?Arthritis
view(Arthritis)

### Exoloring the data 
data <- Arthritis %>% as_tibble() %>% print()

data %>% qplot(Age, data = .)
hist(data$Age, col = heat.colors(5))

### summary statistics 
summary(data$Age)
data %>% select(Age) %>% summary()

### creating a two age group 
data %<>% 
  mutate(
    Age_group = ifelse(Age < 55, 
                       'Younger', 
                       'Older')) %>%
  print()
view(data)  

### Transforming the age_group into factors 
data %<>% mutate(Age_group = factor(Age_group)) %>% print()
glimpse(data)

### checking all the factor 
data %>% pull(Age_group) %>% levels()
 
### changing the order of the levels
data <- data %>% mutate(Age_group = factor(Age_group, levels = c("Younger", "Older")))
### checking all the factor 
data %>% pull(Age_group) %>% levels()

### checking the frequencies of the factors 
data %>% group_by(Sex) %>% summarize(Count = n())

### checking the frequencies of the factors as proportion 
data %>% with(table(Sex)) %>% prop.table()%>% as_tibble()%>% print()

### checking the two factor relationship
data %>% with(table(Sex, Age_group)) %>% as_tibble()%>% print()

###checking the relationship as a proportions
data %>% with(table(Sex, Age_group)) %>% prop.table()%>% as_tibble()%>% print()




