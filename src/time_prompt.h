#ifndef __TIME_PROMPT_H
#define __TIME_PROMPT_H  1

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

char*		number_to_text(int number, char *return_buffer);
int			dissect_time();

#endif