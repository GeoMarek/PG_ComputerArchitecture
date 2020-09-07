#include<stdio.h>
extern double increment_double(double a);

void test_increment_double() 
{
	double x = 176.548;
	double y = increment_double(x);
	printf("Before: %f\tAfter: %f\n", x, y);

	//x = 127.0;
	//y = increment_double(x);
	//printf("Before: %f\tAfter: %f\n", x, y);

	//x = 78566.878;
	//y = increment_double(x);
	//printf("Before: %f\tAfter: %f\n", x, y);

	x = 4.0;
	y = increment_double(x);
	printf("Before: %f\tAfter: %f\n", x, y);
}
