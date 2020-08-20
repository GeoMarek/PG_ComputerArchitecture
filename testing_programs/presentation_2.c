#include <stdio.h>
#include <memory.h>

extern void encrypt(char* input, char* output, char key);
extern float root_mean_square(float a, float b, float c);
extern float float_by_float(float a, float b);

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
	printf("\n%f * %f is equal %f", a,b, result);
}

void presentation_2()
{
	int count = 10;
	printf("\nRuning test number: %i\n", ++count); test_11(); 
	printf("\nRuning test number: %i\n", ++count); test_12(); 
	printf("\nRuning test number: %i\n", ++count); test_13();
}