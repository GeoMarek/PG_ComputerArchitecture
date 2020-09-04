## Program 22

PL: Program void random_encrypt(char * text) szyfruje każdy bajt argumentu poprzez wykonanie operacji XOR, której drugim argumentem jest ciąg 8 bitów. Ciąg ma inną postać dla każdego bajtu i stanowi 8 najmłodszych bitów 32-bitowej liczby losowej. Pierwsza liczba losowa ma wartość 52525252H, a następne obliczane są w poniższy sposób:
1. wyznacza się sumę modulo dwa bitów nr 30 i 31
2. przesuwa się całą liczbę 32-bitową o jedną pozycję w lewo,
3. na bit nr 0 liczby wprowadza się wcześniej obliczoną sumę modulo dwa

EN: Program void random_encrypt(char * text) encrypts every byte of the argument by execution of an XOR operation, whose second argument is a sequence of 8 bits. The sequence has a different form for each byte and represents 8 youngest bits of 32-bit a random number. The first random number has the value 52525252H and the following are calculated in the following
way:
1. the sum of modulo two bits No. 30 and 31 is determined,
2. you move the whole 32-bit number by one position to the left,
3. for bit no. 0 the numbers are entered earlier the calculated sum of modulo two
