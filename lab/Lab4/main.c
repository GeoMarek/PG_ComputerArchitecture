#include <stdio.h>
#include <xmmintrin.h>

extern float znajdz_max_wysokosc(float v, float alpha);
extern __m128 mul_at_once(__m128  one, __m128 two);

int main()
{
	/* zadanie pierwsze */
	
	float x = znajdz_max_wysokosc(3.0, 30.0f);
	printf("Wynik to %f\n", x);

	/* zadanie drugie */

	__m128 u1, u2, result;

	for (int i = 0; i < 4; ++i) {
		u1.m128_i32[i] = i;
		u2.m128_i32[i] = i;
	}

	result = mul_at_once(u1, u2);

	for (int i = 0; i < 4; ++i) 
	{
		printf(" %d", result.m128_i32[i]);
	}

	return 0;
}