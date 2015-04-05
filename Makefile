CC=gcc
CFLAGS=-c -Wall -g
EXECUTABLE=time_prompt

all: time_prompt

time_prompt: main.o time_prompt.o
	$(CC) main.o time_prompt.o -o $(EXECUTABLE)

main.o: main.c
	$(CC) $(CFLAGS) main.c

time_prompt.o: time_prompt.c
	$(CC) $(CFLAGS) time_prompt.c

clean:
	rm *o $(EXECUTABLE)
