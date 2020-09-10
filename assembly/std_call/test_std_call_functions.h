#include<stdio.h>
extern int processors_number();
extern unsigned int free_disk_space(char* disk);
extern char* actual_hour();

void test_std_call() 
{
	char disk[3] = "C:";
	printf("Processors number: %i\n", processors_number());
	printf("Free space in GB: %i\n", free_disk_space(disk));
	printf("Actual hour is %s\n", actual_hour());
}