# main: pgcd.o main.o
# 	cc -std=c99 -o main pgcd.o main.o

# pgcd.o: pgcd.c pgcd.h
# 	cc -std=c99 -o pgcd.o -c pgcd.c -Wall -O 
	
# main.o: main.c pgcd.h
# 	cc -std=c99 -o main.o -c main.c -Wall -O

CC=gcc
LDFLAGS=-lm
EXEC=main
SRC=./src/main.c ./src/pgcd.c

OBJ= $(SRC:.c=.o)

CFLAGS=-O2 -Wall

all: $(EXEC)

main: $(OBJ) 
	$(CC) $(CFLAGS) -o ./bin/$@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $< $(CFLAGS)

.PHONY: clean mrproper

clean: $(OBJ)
	find . -name *.o -delete

mrproper: clean
	rm $(EXEC)