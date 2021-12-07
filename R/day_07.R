input <- read.csv("../data/input_07.txt", header = FALSE) %>%
  unlist() %>% 
  as.vector()

# function to calculate fuel use of one horizontal position for task 1
fuel_1 <- function(pos, pos_vec) {
  return(sum(abs(pos_vec - pos)))
}

# function to calculate fuel use of one horizontal position for task 2
fuel_2 <- function(pos, pos_vec) {
  n_vec <- abs(pos_vec - pos)
  fuel_vec <- (n_vec * (n_vec + 1)) / 2
  return(sum(fuel_vec))
}

# all possible horizontal positions
x_vals <- min(input):max(input)

# calculate fuel use for each position
fuel_vec_1 <- vapply(x_vals, fuel_1, 1, pos_vec = input)
fuel_vec_2 <- vapply(x_vals, fuel_2, 1, pos_vec = input)

cat("Fuel use task 1:", min(fuel_vec_1), ";\n")

cat("Fuel use task 2:", min(fuel_vec_2), ".\n")
