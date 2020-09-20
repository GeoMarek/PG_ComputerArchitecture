#include<stdio.h>
extern void shift_left_96bit(int* a, int* b, int* c);

void test_shift_left_96_bit() 
{
	int a = (int)malloc(sizeof(int)); a = 2147483648;
	int b = (int)malloc(sizeof(int)); b = 2147483648;
	int c = (int)malloc(sizeof(int)); c = 1;
	shift_left_96bit(&a, &b, &c);
	printf("A: %i\tB: %i\tC: %i", a, b, c);
}