#include<stdio.h>
#include <stdlib.h>
extern float weighted_average(int n, float* scores, float* scales);

void test_weighted_average() 
{
	int n = 3;
	float scales[3] = { 2.2f, 2.7f, 4.1f };
	float scores[3] = { 6.5f, 1.5f, 4.4f };
	float result = weighted_average(n, scores, scales);
	printf("%f", result);
}

