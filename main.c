#include <stdio.h>
extern float number_pi(int n);
extern int is_inside(int x, int y, int z, int r, int h);

int main() {
	/* subprogram 1 - approximate number pi */
	/*
	printf("Enter number of elements\n\t");
	int n = 0;
	scanf_s("%i", &n);
	printf("Value of Pi number is:\n");
	float pi = number_pi(n);
	printf("\t%f", pi);
	*/

	/* subprogram 2 - is point inside a cylinder */
	printf("x=5 y=0 z=5 r=5 h=6 => ");
	int ret = is_inside(5, 0, 5, 5, 6);
	printf("Result is: %i\n", ret);
	
	printf("x=0 y=5 z=7 r=5 h=6 => ");
	ret = is_inside(0, 5, 7, 5, 6);
	printf("Result is: %i\n", ret);
	
	printf("x=2 y=1 z=3 r=7 h=11 => ");
	ret = is_inside(2, 1, 3, 7, 11);
	printf("Result is: %i\n", ret);


	return 0;
}