extern double* float_to_double(float x);
#include <stdio.h>

void test_float_to_double()
{
	float x = -142.2765;
	double* y = float_to_double(x);
	printf("%f\n", *y);
}
