#include "time_prompt.h"

/* Few Handy Constants */
const int 		MAX_NUMBER_CONVERSION_SUPPORTED			=		1000;
const int		MILLIS_IN_SECOND						=		1000;
const int		SECONDS_IN_MINUTE						=		60;
const int		MINUTES_IN_HOUR							=		60;
const int		MAX_HOURS								=		23;
const int		BUFFER_SIZE								= 		65535;


char *one_to_twenty[] = {
	"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
	"eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", 
	"eighteen", "nineteen", "twenty"
};
char *the_tens[] = {"ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};

/* Converts a given integer number, it returns its text form. Currently 
 * supports number less than thousand(max limit of a millisecond).
 */
char*
number_to_text(int number, char *return_buffer) {

	return_buffer[0] = '\0' ;
	if(number <= 0 || number >= MAX_NUMBER_CONVERSION_SUPPORTED) {
		return return_buffer;
	}
	
	

	int hundreds, tens, ones;
	ones = number % 10;
	tens = (number / 10) % 10;
	hundreds = (number / 100) % 10;

	if(hundreds != 0) {
		strcat(return_buffer, one_to_twenty[hundreds - 1]);
		strcat(return_buffer, " hundred ");
		if(number % 100 == 0)
			return return_buffer;
	}

	if((number % 100) > 20) {
		strcat(return_buffer, the_tens[tens - 1]);
		strcat(return_buffer, " ");
	} else {
		int  combined = number % 100;
		strcat(return_buffer, one_to_twenty[combined - 1]);
	}

	if(ones != 0 && (number % 100) > 20) {
		strcat(return_buffer, one_to_twenty[ones - 1]);
	}

	return return_buffer;
}

int
dissect_time() {
	return -1;
}