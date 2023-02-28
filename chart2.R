library(dplyr)
library(ggplot2)
library(tidyr)

# Load CSV file
spldata <- read.csv("/Users/momofarah/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Filter and summarize data for selected books and year
title_comp_checkouts <- spldata %>%
  filter(Title %in% c("Verity", "It Ends with Us: A Novel"), CheckoutYear == 2022) %>% 
  group_by(CheckoutMonth, Title) %>%
  summarize(total_checkouts_spl = sum(Checkouts))

# Create bar graph
ggplot(title_comp_checkouts, aes(x = factor(CheckoutMonth), y = total_checkouts_spl, fill = Title)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("green", "blue")) +
  scale_x_discrete(name = "Months") +
  labs(title = "It Ends with Us: A Novel vs Verity Monthly Checkouts in 2022", y = "Total Checkouts", fill = "Title")
