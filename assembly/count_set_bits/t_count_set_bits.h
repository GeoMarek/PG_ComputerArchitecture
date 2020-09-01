extern int count_set_bit(int num)

void test_count_set_bit()
{
	for (int i = 0; i < 20; ++i) 
	{
		printf("num: %i\t bits: %i\n", i, count_set_bits(i));
	}
}