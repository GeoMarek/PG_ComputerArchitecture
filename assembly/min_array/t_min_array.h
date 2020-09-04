#include <stdio.h>
extern int min_array(int* arr, int size);

void test_min_array() 
{
	int arr[7] = { 1, 5, 7, 12, -7, -23, 0 };
	int min = min_array(arr, 7);
	printf("Minimum: %i\n", min);
}