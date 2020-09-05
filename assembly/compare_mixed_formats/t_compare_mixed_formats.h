#include<stdio.h>
extern int compare_mixed_formats(int first, int second);

void test_compare_mixed_formats() 
{
	// should be 1
	{
		int first = 0xFF'FF'FF'FF;
		int second = 0x80'00'00'00;
		int res = compare_mixed_formats(first, second);
		printf("%i\n", res);
	}

	// should be 0
	{
		int first = 0xFE'00'00'00;
		int second = 0x7F'00'00'00;
		int res = compare_mixed_formats(first, second);
		printf("%i\n", res);
	}

}