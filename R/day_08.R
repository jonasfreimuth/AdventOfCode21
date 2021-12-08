library("stringr")

ssd_dat <- readLines("../data/input_08.txt") %>% 
  data.frame(x = .) %>% 
  mutate(signal = str_extract(x, "[\\w\\s]*(?=\\|)"),
         output = str_extract(x, "(?<=\\|)[\\w\\s]*")) %>% 
  select(-x)

ssd_dat %>% 
  mutate(n_8_4_7_1 = str_count(output,
                               "\\b(\\w{7}|\\w{4}|\\w{3}|\\w{2})\\b")) %>% 
  extract2("n_8_4_7_1") %>% 
  sum() %>% 
  cat("Sum number of digits 1, 4, 7, and 8:", ., "\n")
