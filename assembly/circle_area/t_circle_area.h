#include<stdio.h>
extern float circle_area(float r);


void test_circle_area() 
{
	float r = 10.0f;
	float area = circle_area(r);
	printf("We have a circle with radius r = %f.\nThis circle has area equal to: %f.", r, area);
}
