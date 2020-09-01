#include <stdio.h> 
extern int binary_to_decimal(const char* text);

void test_binary_to_decimal() 
{
	const char* text = "001101010011";
	int num = binary_to_decimal(text);
	printf("%s is %i in decimal", text, num);
}