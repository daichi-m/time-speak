CC=gcc
CFLAGS=-c -Wall -g
EXECUTABLE_DIR=bin
EXECUTABLE=time_prompt
OBJECT_DIR=obj

all: time_prompt

time_prompt: dircreate main.o time_prompt.o
	
	$(CC) $(OBJECT_DIR)/main.o $(OBJECT_DIR)/time_prompt.o -o $(EXECUTABLE_DIR)/$(EXECUTABLE)

dircreate:
	mkdir -p $(EXECUTABLE_DIR)
	mkdir -p $(OBJECT_DIR)

main.o: main.c
	$(CC) $(CFLAGS) main.c -o $(OBJECT_DIR)/main.o

time_prompt.o: time_prompt.c
	$(CC) $(CFLAGS) time_prompt.c -o $(OBJECT_DIR)/time_prompt.o

clean:
	rm $(OBJECT_DIR)/*.o 
	rm $(EXECUTABLE_DIR)/$(EXECUTABLE)
	rm -rf $(EXECUTABLE_DIR)