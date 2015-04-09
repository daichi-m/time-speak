#include <CUnit/CUnit.h>
#include "test_time_prompt.h"

#define 		TEST_NAME(func) 			(#func)


int main() {

	CU_ErrorCode err = CU_initialize_registry();
	if(err != CUE_SUCCESS) {
		fprintf(stderr, "Could not intialize registry. Error: %s\n", CU_get_error_msg());
		return 1;
	}

	CU_TestInfo time_prompt_tests [] = {
		{TEST_NAME(test_number_to_text), test_number_to_text },
		CU_TEST_INFO_NULL
	};

	CU_SuiteInfo suites [] = {
		{"time_prompt", NULL, NULL, time_prompt_tests},
		CU_SUITE_INFO_NULL
	};
	err = CU_register_suites(suites);
	if(err != CUE_SUCCESS) {
		fprintf(stderr, "Could not register the suites. Error: %s\n", CU_get_error_msg());
		return 1;
	}

	CU_basic_run_tests();

	CU_cleanup_registry();
	return 0;
}