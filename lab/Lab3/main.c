#include <stdio.h>

extern int dot_product(int* tab1, int* tab2, int n);
extern merge(int* tab1, int* tab2, int n);

int main()
{
	
	int n;
	printf("Podaj rozmiar: \n");
	scanf_s("%d", &n);

	int* tab2 = (int*)malloc(n * sizeof(int));
	int* tab1 = (int*)malloc(n * sizeof(int));
	
	printf("Podaj tablice1: ");
	for (int i = 0; i < n; i++) {
		scanf_s("%d", tab1 + i);
	}
	printf("\nPodaj tablice2: ");
	for (int i = 0; i < n; i++) {
		scanf_s("%d", tab2 + i);
	}

	int x = dot_product(tab1, tab2, n);
	printf("\nIloczyn wynosi %i", x);

	free(tab1);
	free(tab2);

/*	int n;
	printf("Podaj rozmiar: \n");
	scanf_s("%d", &n);

	int* tab2 = (int*)malloc(n * sizeof(int));
	int* tab1 = (int*)malloc(n * sizeof(int));
	
	printf("Podaj tablice1: ");
	for (int i = 0; i < n; i++) {
		scanf_s("%d", tab1 + i);
	}
	printf("\nPodaj tablice2: ");
	for (int i = 0; i < n; i++) {
		scanf_s("%d", tab2 + i);
	}

	int* y = merge(tab1, tab2, n);
	if (y == 0)
	{
		printf("Zly rozmiar tablicy\n");
	}
	else {
		printf("Wynik mergu\n");
		for (int i = 0; i < 2 * n; i++) {
			printf("%i\n", y[i]);
		}
	}


	free(tab1);
	free(tab2)*/;

	return 0;
}