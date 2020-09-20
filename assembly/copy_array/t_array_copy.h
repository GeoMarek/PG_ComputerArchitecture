#include <stdio.h>
extern int* array_copy(int* arr, int size);

void test_array_copy() 
{
	int size = 5;
	int arr[] = { 1,2,3,4,5 };
	int* ptr = arr;
	int* res = array_copy(arr, size);
	for (int i = 0; i < size; i++) printf("%i\t%i\n", arr[i], res[i]);
}