extern void encrypt(char* input, char* output, char key)

void test_encrypt()
{
	char input[] = "ABCDEFGHIJKLMNOPQRSTUVWYXZ";
	char key = 'H';
	char* output = calloc(80,1);
	encrypt(input, output, key);
	printf("%s\n", input);
	printf("%s\n", output);
	free(output);
}