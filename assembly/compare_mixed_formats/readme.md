## Program 26

PL: Program int compare_mixed_formats(int first, int second) porównuje dwie liczby mieszane bez znaku, które są zapisane w różnych formatach. W pierwszym argumencie najmniej znaczący bit ma wartość 2^(-8), a w drugim formacie 2^(-7). Funkcja zwraca 0, gdy liczby są równe, jeden, gdy drugi jest większy i minus jeden, gdy pierwszy jest większy.

EN: The program int compare_mixed_formats(int first, int second) compares two unsigned mixed numbers that are stored in different formats. In the first argument the least significant bit is 2^(-8), and in the second format 2^(-7). The function returns 0 when numbers are equal, one when the second is greater, and minus one when the first is greater.