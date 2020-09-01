extern void convert_to_byte_array(char** source, int x, int y, char* dest);

void test_convert_to_byte_array() 
{	
	char line1[] = { 0,1,1,1,1,1,1,1 };
	char line2[] = { 0,1,1,1,1,1,1,1 };
	char line3[] = { 0,1,1,1,1,1,1,1 };
	char* src[] = { line1, line2, line3 };
	const int bits = 8;
	const int x = 8;
	const int y = 3;
	size_t bytes_to_alloc = x * y / bits;
	char* result = (char*)malloc(bytes_to_alloc);
	memset(result, 1, bytes_to_alloc);
	convert_to_byte_array(src, x, y, result);
	for (size_t i = 0; i < bytes_to_alloc; ++i) printf("%i\n", result[i]);
	free(result);
}