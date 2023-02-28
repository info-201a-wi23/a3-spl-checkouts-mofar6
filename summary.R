library(dplyr)
library(tidyr)
library(ggplot2)

spldata <- read.csv("/Users/momofarah/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# How many checkouts does Michelle Obama have each year from 2018 to 2022?
michelle_obama_checkout <- spldata %>% 
  filter(Creator == "Barack Obama", na.rm = TRUE, CheckoutYear %in% c(2018, 2019, 2020, 2021, 2022)) %>%
  group_by(CheckoutYear) %>%
  summarize(Total_Checkouts_Michelle = sum(Checkouts)) %>% 
  ungroup()
print(michelle_obama_checkout)


# How many checkouts does Barck Obama have each year from 2018 to 2022?
barack_obama_checkout <- spldata %>% 
  filter(Creator == "Barack Obama", na.rm = TRUE, CheckoutYear %in% c(2018, 2019, 2020, 2021, 2022)) %>%
  group_by(CheckoutYear) %>%
  summarize(Total_Checkouts_Barack = sum(Checkouts)) %>% 
  ungroup()


# How many toal videodisc checkouts from 2017 to 2023?
videodisc_checkout <- spldata %>% 
  filter(MaterialType == "VIDEODISC", na.rm = TRUE, CheckoutYear %in% c(2017, 2018, 2019, 2020, 2021, 2022, 2023)) %>%
  group_by(CheckoutYear) %>%
  summarize(Total_VideoDisc = sum(Checkouts)) %>% 
  ungroup()

# How many toal audiobook checkouts from 2017 to 2023?
audiobook_checkout <- spldata %>% 
  filter(MaterialType == "AUDIOBOOK", na.rm = TRUE, CheckoutYear %in% c(2017, 2018, 2019, 2020, 2021, 2022, 2023)) %>%
  group_by(CheckoutYear) %>%
  summarize(Total_AudioBook = sum(Checkouts)) %>% 
  ungroup()


# How many checkouts did the book "Verity" had in 2022?
verity_checkouts <- spldata %>% 
  filter(CheckoutYear == 2022) %>%
  filter(Title == "Verity", na.rm = TRUE) %>% 
  summarize(Checkouts = sum(Checkouts)) %>%
  pull(Checkouts)


# How many checkouts did the book "It Ends with Us: A Novel" had in 2022?
itendswithus_checkouts <- spldata %>% 
  filter(CheckoutYear == 2022) %>%
  filter(Title == "It Ends with Us: A Novel", na.rm = TRUE) %>% 
  summarize(Checkouts = sum(Checkouts)) %>%
  pull(Checkouts)


print(michelle_obama_checkout)
print(barack_obama_checkout)
print(videodisc_checkout)
print(audiobook_checkout)
print(verity_checkouts)
print(itendswithus_checkouts)
