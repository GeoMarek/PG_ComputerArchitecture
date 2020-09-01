#include <malloc.h>
#include <stdio.h>
extern void copy_even_from_array(int* input, int* output, int size);

void test_copy_even_from_array() 
{
	int size = 5;
	int input[] = { 1,3,52,71,97 };
	int* output = (int*)malloc(sizeof(int) * size);
	copy_even_from_array(input, output, size);
	for (int i = 0; i < size; ++i) 
	{
		printf("%i, ", output[i]);
	}
}