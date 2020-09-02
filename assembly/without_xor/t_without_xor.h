#include <stdio.h>
extern int without_xor(int a, int b);

void test_without_xor() 
{
	int a = 7; int b = 15;
	int c = without_xor(a, b);
	printf("%i", c);
}

