CC=gcc
CFLAGS=-c -Wall -g
CUNIT_FLAG=-lcunit
EXECUTABLE_DIR=bin
EXECUTABLE=time_prompt
TEST_EXECUTABLE=test
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
	rm -f $(TEST)/*.o
	rm -f $(TEST)/$(TEST_EXECUTABLE)

test: test_main.o test_time_prompt.o time_prompt.o
	$(CC)  $(TEST)/test_main.o  $(TEST)/test_time_prompt.o  $(OBJECT_DIR)/time_prompt.o -o $(TEST)/$(TEST_EXECUTABLE)	$(CUNIT_FLAG)
	$(TEST)/$(TEST_EXECUTABLE)

test_main.o: $(TEST)/test_main.c
	$(CC)  $(CFLAGS)  $(CUNIT_FLAG)  $(TEST)/test_main.c 	-o $(TEST)/test_main.o

test_time_prompt.o: $(TEST)/test_time_prompt.c
	$(CC)  $(CFLAGS) $(CUNIT_FLAG)  $(TEST)/test_time_prompt.c  -o $(TEST)/test_time_prompt.o