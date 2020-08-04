# AssemblerExercises

It is a set of tasks performed within the subject of computer architecture. I use MASM compiler and Visual Studio 2019

## Program 1

EN: A program adapted to call from the C language level with a prototype float number_pi. It should determine the number Pi by calculating the product of n consecutive sequence elements:

PL: Program przystosowany do wywołań z poziomu języka C z prototypem float number_pi. Powinien określić liczbę Pi, obliczając iloczyn n kolejnych elementów szeregu:

<a href="https://www.codecogs.com/eqnedit.php?latex=\pi&space;=&space;2&space;\cdot&space;\frac{2}{1&space;}&space;\cdot&space;\frac{2}{3&space;}&space;\cdot&space;\frac{4}{3&space;}&space;\cdot&space;\frac{4}{5&space;}&space;\cdot&space;\frac{6}{5&space;}&space;\cdot&space;\frac{6}{7&space;}&space;\cdot&space;\frac{8}{7&space;}&space;\cdot&space;\frac{8}{9&space;}&space;\cdot&space;\frac{10}{9&space;}&space;\cdot&space;\frac{10}{11&space;}&space;\cdots" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\pi&space;=&space;2&space;\cdot&space;\frac{2}{1&space;}&space;\cdot&space;\frac{2}{3&space;}&space;\cdot&space;\frac{4}{3&space;}&space;\cdot&space;\frac{4}{5&space;}&space;\cdot&space;\frac{6}{5&space;}&space;\cdot&space;\frac{6}{7&space;}&space;\cdot&space;\frac{8}{7&space;}&space;\cdot&space;\frac{8}{9&space;}&space;\cdot&space;\frac{10}{9&space;}&space;\cdot&space;\frac{10}{11&space;}&space;\cdots" title="\pi = 2 \cdot \frac{2}{1 } \cdot \frac{2}{3 } \cdot \frac{4}{3 } \cdot \frac{4}{5 } \cdot \frac{6}{5 } \cdot \frac{6}{7 } \cdot \frac{8}{7 } \cdot \frac{8}{9 } \cdot \frac{10}{9 } \cdot \frac{10}{11 } \cdots" /></a>

## Program 2

EN: The program int is_inside(int x, int y, int z, int r, int h) checks if the point with x, y and z coordinates is inside a cylinder with radius and height h, where its centre of base is in the centre of the coordinate system, and the cylinder's axis is on the Z axis. It returns 1 if it is inside and 0 if not. 

PL: Program int is_inside(int x, int y, int z, int r, int h) sprawdza, czy punkt o współrzędnych x, y i z znajduje się wewnątrz walca o promieniu r i wysokości h, gdzie jego środek podstawy znajduje się w środku układu współrzędnych, zaś oś walca leży na osi Z układu. Zwraca 1 jeśli jest wewnątrz i 0, w przeciwnym wypadku. 

## Program 3

PL: Program do wywołania w C o prototypie char* join_words(char* sep, char** list, int n, char* buf) powinien w bufore zapisywać kolejne podtablice listy oddzielone separatorem. Funkcja zwraca adres wynikowej tablicy.

EN: The program to be called in C with the prototype char* join_words(char* sep, char** list, int n, char* buf) should write successive list sub-tabs separated by a separator in the buffer. The function returns the address of the resulting array.

## Program 4

PL: Program o prototypie int count_set_bit(int num) który służy do zliczania ilości bitów ustawionych na jeden.

EN: A program with the prototype int count_set_bit(int num) which is used to count the number of bits set to one.

## Program 5

PL: Program o prototypie int multiply_by_ten(int num), który służy do mnożenie liczby podanej jako argument przez 10 (nie wykorzytuję tutaj rozkazów mul, imul czy lea).

EN: A program with the prototype int multiply_by_ten(int num), which is used to multiply the number given as an argument by 10 (I don't use the commands like mul, imul or lea).

## Program 6

PL: Program int decimal count(int num) służy do zliczania sumy cyfr liczby podaneuj jako argument. 

EN: The int decimal count(int num) program is used to count the sum of digits of a number given as an argument. 

## Program 7

PL: Program int binary_to_decimal(char* text) konwertuje ciąg znaków złozonych z zer i jedynek na liczbę. 

EN: The int binary_to_decimal(char* text) program converts a string of characters composed of zeros and ones into numbers. 

## Program 8

PL: Program void copy_even_from_array(int* input, int* output, int size) kopiuje do tablicy wynikowej wszystkie parzyste elementy i wstawia je po kolei. Na pustych miejscach wstawia wartość -1. 

EN: The void copy_even_from_array(int* input, int* output, int size) program copies all even items to the result array. In empty spaces, insert the value -1. 

## Program 9

PL: Program int minus2_to_binary(unsigned int num) dokonuje konwersji liczby zapisanej w formacie minus dwójkowym na liczbę w kodzie U2. Kod minus dwójkowy ma postać:

EN: The int minus2_to_binary(unsigned int num) program converts a number written in minus binary format to a number in U2. The minus binary code is in form:

<a href="https://www.codecogs.com/eqnedit.php?latex=w=&space;\sum_{i=0}^{m-1}&space;x_{i}&space;\cdot&space;(-2)^{i}&space;\Rightarrow&space;00011001&space;=&space;1&space;\cdot&space;(-2)^4&space;&plus;&space;1&space;\cdot&space;(-2)^3&space;&plus;&space;1&space;\cdot&space;(-2)^0&space;=&space;9" target="_blank"><img src="https://latex.codecogs.com/gif.latex?w=&space;\sum_{i=0}^{m-1}&space;x_{i}&space;\cdot&space;(-2)^{i}&space;\Rightarrow&space;00011001&space;=&space;1&space;\cdot&space;(-2)^4&space;&plus;&space;1&space;\cdot&space;(-2)^3&space;&plus;&space;1&space;\cdot&space;(-2)^0&space;=&space;9" title="w= \sum_{i=0}^{m-1} x_{i} \cdot (-2)^{i} \Rightarrow 00011001 = 1 \cdot (-2)^4 + 1 \cdot (-2)^3 + 1 \cdot (-2)^0 = 9" /></a>

## Program 10

PL: Program unsigned int compress(char* original, char* source) dokonuje kompresji tekstu z podstawowym alfabetem . Każdy kolejny ciąg tych samych znaków zostanie zamieniony na parę znaków ASCII *znak, liczba*. Znaki nie powtarzające się sa kopiowane bez zmian, a program zwraca ilość znaków w buforze wyjsciowym. 

EN: The program unsigned int compress(char* original, char* source) compresses text with the basic ASCII alphabet . Each successive sequence of the same characters will be converted into an pair char, count. Non-repeating characters are copied unchanged and the program returns the number of characters in the output buffer. 

## Program 11

PL: Program o prototypie void encrypt(char* input, char* output, char key) dokonuje szyfrowania tekstu wejściowego za pomocą klucza wg zasady *output=input+klucz*. Jeśli output ma kod większy niż znak 'Z' to wtedy odejmowane jest od niego 26, by wynikowy znak był literą alfabetu.

EN: A program with a prototype void encrypt(char* input, char* output, char key) encrypts the input text with rule: output=input+key. If the output has a code larger than the 'Z' character, then 26 is subtracted from it so that the resulting character is an alphabetical letter.

## Program 12

PL: Program float root_mean_square(float a, float b, float c) służy od obliczania średniej kwadratowej z trzech liczb podanych jako argument. 

EN: The float root_mean_square(float a, float b, float c) program is used to calculate the rms average of the three numbers given as an argument. 