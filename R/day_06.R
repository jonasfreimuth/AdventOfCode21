library("magrittr")
library("stringr")

# read input, add one to make indexing easiser
input <- read.csv("../data/input_06.txt", header = FALSE) %>%
  unlist() %>%
  set_names(NULL) %>% 
  add(1) %>% 
  table()

pop_vec <- rep(0, 9) %>% 
  set_names(1:9)

# inelegant way to populate the matrix of the population
for (i in names(input)) {
  pop_vec[[i]] <- input[[i]]
}

# remove names again
names(pop_vec) <- NULL

# define vector for shifting stuff towards 0
shift_vec <- c(2:9, 1)

t_end <- 256
t_cur <- 1

while (t_end >= t_cur) {
  
  # shift everything forward
  pop_vec <- pop_vec[shift_vec]
  
  # take the last element ("fish that were spawned") and add it to the 7th 
  # element, as the parents of the fish that were spawned
  pop_vec[7] <- pop_vec[7] + pop_vec[9]
  
  # Naive implementation (task 1):
  # # get vector of indices of fish which have become 0
  # # models fish that have reproduced
  # zero_ind <- fish_vec == 0
  # 
  # # reset those fish that reproduced to 6
  # fish_vec[zero_ind] <- 6
  # 
  # # decrement all non spawning fish by 1 to model growth
  # fish_vec[!zero_ind] <- fish_vec[!zero_ind] - 1
  # 
  # # add the fish that just spawned
  # fish_vec <- c(fish_vec, rep(8, sum(zero_ind)))
  # 
  # ## print new fish vec
  # # cat("After day ", str_pad(t_cur, str_length(t_end)), ": ", fish_vec, "\n")
  
  # increment days that have passed
  t_cur <- t_cur + 1
  
}

cat("Final number of fish: ", sum(pop_vec))
