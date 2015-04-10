#include "test_time_prompt.h"

void
test_number_to_text() {

	int test_numbers[] = {4, 24, 30, 45, 100, 102, 114, 130, 146, 1000, -2};
	char *test_texts[] = {
		"four",
		"twenty four",
		"thirty ",
		"forty five",
		"one hundred ",
		"one hundred two",
		"one hundred fourteen",
		"one hundred thirty ",
		"one hundred forty six",
		"",
		""
	};
	int len = 11;
	int i;
	const int BUFFER_SIZE = 65535;
	char tmp_buffer[BUFFER_SIZE];

	for(i=0; i<len; i++) {
		number_to_text(test_numbers[i], tmp_buffer);
		CU_ASSERT_STRING_EQUAL(test_texts[i], tmp_buffer);
		
	}
}