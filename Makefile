
CC = clang
CFLAGS = -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow

# Dirs
SRC_C = src/c
SRC_JL = src/julia

# Targets
all: caesar vigenere initials

caesar: $(SRC_C)/caesar.c
	$(CC) $(CFLAGS) -o caesar $(SRC_C)/caesar.c -lcs50

vigenere: $(SRC_C)/vigenere.c
	$(CC) $(CFLAGS) -o vigenere $(SRC_C)/vigenere.c -lcs50

initials: $(SRC_C)/initials.c
	$(CC) $(CFLAGS) -o initials $(SRC_C)/initials.c -lcs50

# Julia helpers
run-caesar-jl:
	julia $(SRC_JL)/caesar.jl $(KEY)

run-vigenere-jl:
	julia $(SRC_JL)/vigenere.jl $(KEY)

run-initials-jl:
	julia $(SRC_JL)/initials.jl

clean:
	rm -f caesar vigenere initials *.o
