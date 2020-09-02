#include<stdio.h>
extern int u2_to_sign_modul(int a);

void test_u2_to_sign_modul() 
{
	int a = -1023;
	int b = u2_to_sign_modul(a);
	printf("U2: %i\tSM: %i", a, b);
}
