library("magrittr")

# convert input to numeric matrix
input_mat <- readLines("../data/input.txt") %>% 
  strsplit("") %>% 
  lapply(as.numeric) %>% 
  unlist() %>% 
  matrix(nrow = 1000, ncol = 12, byrow = TRUE)

# extract mode of each column for the gamma frequency bits
gamma_bits <- apply(input_mat, 2, function(col) {
  tab <- table(col)
  tab[tab == max(tab)] %>% 
    names() %>% 
    as.numeric()
})

# invert gamma frequency bits
# wouldn't have noticed you can just do this instead of applying the above 
#   function using min if it wasn't for you, Tobi
epsilon_bits <- -(gamma_bits - 1)

# convert bits to number
# nicked from https://stackoverflow.com/a/69819329
gamma   <- sum(gamma_bits   * 2 ^ ((length(gamma_bits  ) - 1):0))
epsilon <- sum(epsilon_bits * 2 ^ ((length(epsilon_bits) - 1):0))

print(paste("Power consumption is:", gamma * epsilon))