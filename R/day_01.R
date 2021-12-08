library("dplyr")

input <- readLines("../data/input_01.txt") %>% 
  as.numeric()

input %>% 
  diff() %>% 
  is_greater_than(0) %>% 
  sum() %>% 
  cat("Task1: Number of increases is", ., "\n")

data.frame(x = input) %>%  
  mutate(slide_sum = lead(x) + x + lag(x),
         slide_sum_diff = c(diff(slide_sum), NA),
         slide_sum_incr = slide_sum_diff > 0) %>% 
  extract2("slide_sum_incr") %>% 
  sum(na.rm = TRUE) %>% 
  cat("Task2: Number of increases is", ., "\n")

