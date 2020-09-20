extern unsigned int compress(char* original, char* dest);

void test_compress()
{
	char input[] = "aaaaaxbbbcccccdddd";
	char* output = (char*)calloc(80);
	unsigned int result = compress(input, output);
	printf("%i\n", result);
	printf("%s", output);
}