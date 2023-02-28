library(dplyr)
library(ggplot2)
library(tidyr)

# Load CSV file
spldata <- read.csv("/Users/momofarah/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Michelle vs Barack Obama stats from 2018-2022
obama_stats<- spldata %>% 
  filter(Creator %in% c("Barack Obama", "Michelle Obama"))

# Michelle vs Barack Obama yearly checkouts
obama_yearly_checkouts <- obama_stats %>% 
  group_by(CheckoutYear, Creator) %>% 
  summarize(total_obama = sum(Checkouts, na.rm = TRUE)) 


# Create line graph
ggplot(data = obama_yearly_checkouts) +
  geom_line(aes(x = CheckoutYear, y = total_obama, color = Creator)) +
  labs(title = "Michelle Obama vs Barack Obama Checkouts from 2018-2020", 
       x = "Years",
       y = "Total Checkouts") +
  scale_x_continuous(limits = c(2018, 2022)) 

