#include<stdio.h>

extern int szukaj4_max(int a, int b, int c, int d);
extern int liczba_przeciwna(int a);
extern void odejmij_jeden(int** a);
extern void podmien(int tab[], int n);


int main()
{
	// zadanie 3.1
	int x1[4] = { -1, 4, -8, 0 };
	printf("Max is %i\n", szukaj4_max(x1[0], x1[1], x1[2], x1[3]));
	
	// zadanie 3.2
	int x2= 178;
	printf("Negativ number from %i is %i\n", x2, liczba_przeciwna(x2));
	
	// zadanie 3.3
	int x3 = 5;
	int* x3_ptr = &x3;
	printf("Before: %i\n", x3);
	odejmij_jeden(&x3_ptr);
	printf("After %i\n", x3);

	// zadanie 3.4
	int arr[10] = { 1,9,2,8,3,0,6,2,5,7};
	printf("Sorting.. \n");
	for (int i = 10; i > 0; i--)
	{
		podmien(arr, 10);
		for (int i = 0; i < 10; ++i) printf("%i ", arr[i]);
		printf("\n");
	}

	return 0;
}