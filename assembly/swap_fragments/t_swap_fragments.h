extern int swap_fragments(char* text, char* old_t, char* new_t);

void test_14() 
{
	printf("Enter text:\n");
	char* text = (char*)malloc(80);
	scanf_s("%s", text, 80);
	char* searched = "aaa";
	char* inserted = "bbb";
	printf("Before: %s\n", text);
	printf("Looking for: %s\nInserting: %s\n", searched, inserted);
	int count = swap_fragments(text, searched, inserted);
	printf("Fragment has been found %i times\n", count);
	printf("After: %s\n", text);
	free(text);
}