extern int decimal_count(int num);


void test_decimal_count() 
{
	for (int i = 3; i < 20; ++i) 
	{
		printf("num: %i\t ret: %i\n", i * 7, decimal_count(i * 7));
	}
}