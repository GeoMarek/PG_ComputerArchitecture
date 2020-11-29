#include <stdio.h>

extern float srednia_harm(float* tab, unsigned int n);
extern float nowy_exp(float x);
extern void sumuj_SSE(char* , char* , char* );
extern void int2float(int* calkowite, float* zmienno_przec);
extern void pm_jeden(float* tab);

int main()
{
	/* zadanie 5.1 */
	float tablica[] = { 10.0f, 20.0f, 30.0f, 40.0f };
	unsigned int n = 4; 
	printf("srednia harmoniczna %f\n", srednia_harm(tablica, n));
	
	/* zadanie 5.2 */
	float exp = nowy_exp(5);
	printf("nowy exp %f\n", exp);

	/* zadanie 5.3 */
	char liczby_A[16] = { -128, -127, -126, -125, -124, -123, -122, -121, 120, 121, 122, 123, 124, 125, 126, 127 };
	char liczby_B[16] = { -3, -3, -3, -3, -3, -3, -3, -3, 3, 3, 3, 3, 3, 3, 3, 3 };
	char suma[16];
	sumuj_SSE(liczby_A, liczby_B, suma);
	
	for (int i = 0; i < 16; i++)
	{
		if (i < 15) printf("%d\t", liczby_A[i]);
		else printf("\n");
	}
	for (int i = 0; i < 16; i++)
	{
		if (i < 15) printf("%d\t", liczby_B[i]);
		else printf("\n");
	}
	for (int i = 0; i < 16; i++)
	{
		if (i < 15) printf("%d\t", suma[i]);
		else printf("\n");
	}

	/* zadanie 5.4 */
	int a[2] = { -17, 24 };
	float r[4];
	int2float(a, r);
	printf("\nKonwersja = %f %f\n", r[0], r[1]);

	/* zadanie 5.5 */
	float tab[4] = { 27.5,143.57,2100.0, -3.51 };
	printf("\n%f %f %f %f\n", tab[0], tab[1], tab[2], tab[3]);
	pm_jeden(tab);
	printf("\n%f %f %f %f\n", tab[0], tab[1], tab[2], tab[3]);

	return 0;
}