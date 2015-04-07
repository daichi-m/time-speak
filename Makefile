CC=gcc
CFLAGS=-c -Wall -g
EXECUTABLE_DIR=bin
EXECUTABLE=time_prompt
OBJECT_DIR=obj
SRC=src
TEST=test

all: time_prompt

time_prompt: dircreate main.o time_prompt.o
	$(CC) $(OBJECT_DIR)/main.o $(OBJECT_DIR)/time_prompt.o -o $(EXECUTABLE_DIR)/$(EXECUTABLE)

dircreate:
	mkdir -p $(EXECUTABLE_DIR)
	mkdir -p $(OBJECT_DIR)

main.o: $(SRC)/main.c
	$(CC) $(CFLAGS) $(SRC)/main.c -o $(OBJECT_DIR)/main.o

time_prompt.o: $(SRC)/time_prompt.c
	$(CC) $(CFLAGS) $(SRC)/time_prompt.c -o $(OBJECT_DIR)/time_prompt.o

clean:
	rm -f $(OBJECT_DIR)/*.o 
	rm -f $(EXECUTABLE_DIR)/$(EXECUTABLE)
	rm -rf $(EXECUTABLE_DIR)