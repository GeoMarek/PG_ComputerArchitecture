#include <stdio.h>
#include <memory.h>
#include <stdlib.h>
#include <string.h>

extern void encrypt(char* input, char* output, char key);
extern float root_mean_square(float a, float b, float c);
extern float float_by_float(float a, float b);
extern int swap_fragments(char* text, char* old_t, char* new_t);

void test_11()
{
	/* encrypt text with key */
	char input[] = "ABCDEFGHIJKLMNOPQRSTUVWYXZ";
	char key = 'H';
	char* output = malloc(80);
	memset(output, 0, 80);
	encrypt(input, output, key);
	printf("%s\n", input);
	printf("%s\n", output);
	free(output);
}
void test_12()
{
	/* root mean square */
	float a = 0.0;
	float b = 3.0;
	float c = 4.0;
	float rms = root_mean_square(a, b, c);
	printf("\nRMS from %f, %f, %f = %f", a,b,c, rms);
}
void test_13() 
{
	/* float by float without fpu */
	float a = -7.0f;
	float b = 2.0f;
	float result = float_by_float(a, b);
	printf("\n%f * %f is equal to %f", a,b, result);
}

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

void presentation_2()
{
	int count = 10;
	printf("\nRuning test number: %i\n", ++count); test_11(); 
	printf("\nRuning test number: %i\n", ++count); test_12(); 
	printf("\nRuning test number: %i\n", ++count); test_13();
}