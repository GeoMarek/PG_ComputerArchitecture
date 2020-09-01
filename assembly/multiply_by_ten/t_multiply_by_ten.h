extern int multiply_by_ten(int num);

void test_multiply_by_ten() 
{
	/* multiply by ten without mul/imul */
	for (int i = 0; i < 20; ++i) 
	{
		printf("num: %i\t ret: %i\n", i, multiply_by_ten(i));
	}
}