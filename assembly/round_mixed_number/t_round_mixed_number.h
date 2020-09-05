extern int round_mixed_number(int n);
#include<stdio.h>

void test_round_mixed_number() 
{
	int old_n = 0x80000040; // -0.500
	int new_n = round_mixed_number(old_n);
	printf("%i\n", new_n);

	old_n = 0x80000041; // -0.501
	new_n = round_mixed_number(old_n);
	printf("%i\n", new_n);

	old_n = 0x00100041; // big positiv number and 0.501 
	new_n = round_mixed_number(old_n);
	printf("%i\n", new_n);

	old_n = 0x0010003F; // big positiv number and 0.499 
	new_n = round_mixed_number(old_n);
	printf("%i\n", new_n);

	old_n = 0x80100041; // big negativ number and -0.501 
	new_n = round_mixed_number(old_n);
	printf("%i\n", new_n);

	old_n = 0x8010003F; // big negativ number and -0.499 
	new_n = round_mixed_number(old_n);
	printf("%i\n", new_n);
}