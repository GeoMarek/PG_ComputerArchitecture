#include <stdio.h>
extern void random_encrypt(char* text);

void test_random_encrypt()
{
	char text[53] = "Jakiœ przyk³adowy tekst\nktóry jest w kilku linijkach";
	random_encrypt(text);
	printf("%s", text);
}