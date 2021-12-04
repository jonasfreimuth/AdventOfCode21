#!/usr/bin/env python3

# inspired by the version by https://github.com/Eixix/Advent-of-Code
def main():
    f_name = "data/input.txt"

    infile = open(f_name)

    n = 0

    # assuming always 12 cols
    ncol = 12
    count_list = [0] * ncol

    # assuming always 1000 rows
    nrow = 1000

    for line in infile:
        for i in range(ncol):
            count_list[i] += int(line[i])

    gamma_bits = [int(x > (nrow / 2)) for x in count_list]

    epsilon_bits = [-(x - 1) for x in gamma_bits]

    gamma   = int("".join(map(str, gamma_bits)),   2)
    epsilon = int("".join(map(str, epsilon_bits)), 2)

    print(f"Power consumption is: {gamma * epsilon}")

if __name__ == "__main__":
    main()
