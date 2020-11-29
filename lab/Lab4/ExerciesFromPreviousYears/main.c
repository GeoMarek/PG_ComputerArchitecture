#include <stdio.h>

extern float srednia_kwadratowa(float* tab, int n);
extern float weighted_average(int n, float* scores, float* scales);
extern float number_pi(int n);

int main()
{
	/* zadanie pierwsze */
	float tablica[5] = { 2.5f, 1.5f, 2.0f, 1.0f, 3.5f };
	int n = 5;
	printf("Wynik to %f\n", srednia_kwadratowa(tablica, n));

	/* zadanie drugie */
	int x = 3;
	float scales[3] = { 2.0f, 4.0f, 1.0f };
	float scores[3] = { 5.0f, 3.0f, 6.0f };
	float result = weighted_average(x, scores, scales);
	printf("Wynik to %f\n", result);

	/* zadanie trzecie */
	int iter = 10;
	float pi = number_pi(iter);
	printf("Liczba Pi wynosi %f\n", pi);

	return 0;
}