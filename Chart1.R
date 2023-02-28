library(dplyr)
library(ggplot2)
library(tidyr)

# Load CSV file
spldata <- read.csv("/Users/momofarah/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Filter and summarize data for selected audiobook and videodisc
audio_video_checkouts <- spldata %>% 
  filter(MaterialType %in% c("AUDIOBOOK", "VIDEODISC")) %>% 
  group_by(CheckoutYear, MaterialType) %>% 
  summarize(total_checkouts = sum(Checkouts))

# Create bar graph showing videodisc vs audiobook
ggplot(audio_video_checkouts, aes(x = CheckoutYear, y = total_checkouts, fill = MaterialType)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("red", "yellow")) +
  labs(title = "AudioBook vs VideoDisc Checkouts by Year",
       x = "Year",
       y = "Total Checkouts",
       fill = "Material Type")

      
      
      
