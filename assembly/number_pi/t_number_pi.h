extern float number_pi(int n);

void test_number_pi()
{
	/* approximate number pi */
	printf("Enter number of elements\n\t");
	int n = 0;
	scanf_s("%i", &n);
	printf("Value of Pi number is:\n");
	float pi = number_pi(n);
	printf("\t%f\n", pi);
}