#include<stdio.h>

extern void int_to_string(int n);

void test_int_to_string() 
{
	int_to_string(-5347653);
	int_to_string(-1);
	int_to_string(0);
	int_to_string(375635);
}
