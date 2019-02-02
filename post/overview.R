library(flexdashboard)
library(tidyverse)
set.seed(345)
date_start <- as.Date("2018-01-01")
product_groups <- c("PG1", "PG2", "PG3")
data <- data.frame(
  product_group = sample(product_groups, 100, replace = T),
  trade_volume = rnorm(100, mean = 3448, sd = 200),
  date = date_start + 1:100
)
data %>% 
  group_by(date) %>% 
  summarise(trade_volume = sum(trade_volume)) %>% 
  ggplot() +
  geom_line(aes(x = date, y = trade_volume), 
           color = "#2780e3",
           alpha = 0.8) +
  theme_minimal() +
  ylab("Trade Volume") +
  xlab("Date")
data %>% 
  ggplot() +
  geom_col(aes(x = reorder(product_group, -trade_volume), y = trade_volume), 
           fill = "#2780e3",
           alpha = 0.8) +
  theme_minimal() +
  ylab("Trade Volume") +
  xlab("Product Group")
data %>% 
  group_by(product_group) %>% 
  summarise(order_count = n()) %>% 
  ggplot() +
  geom_col(aes(x = reorder(product_group, -order_count), y = order_count), 
           fill = "#2780e3",
           alpha = 0.8) +
  theme_minimal() +
  ylab("Order Count") +
  xlab("Product Group")
