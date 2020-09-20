extern int minus2_to_binary(unsigned int num);

void test_minus2_to_binary() 
{
	/* minus binary to U2 */
	// 25 = 11001 = (-2)^4 + (-2)^3 + (-2)^0 = 9
	unsigned int minus_binary = 25;
	int binary = minus2_to_binary(minus_binary);
	printf("%i", binary);
}