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