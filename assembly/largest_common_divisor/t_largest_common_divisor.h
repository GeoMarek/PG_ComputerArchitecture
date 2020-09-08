#include<stdio.h>
extern unsigned int largest_common_divisor(unsigned int a, unsigned int b);

void test_largest_common_divisor() 
{
	unsigned int a = 729u;
	unsigned int b = 1134u;
	unsigned int lcd = largest_common_divisor(a, b);
	printf("Largest common divisor for %i and %i is %i\n", a,b,lcd);
}