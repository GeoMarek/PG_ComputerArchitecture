extern char* join_words(char* sep, char** list, int n, char* buf);

void join_words() 
{
	/* join words */
	int n = 0;
	int chars = 0;
	printf("Enter number of words:");
	scanf_s("%i", &n);
	char** list;
	list = (char**)malloc(sizeof(char*) * n);
	for (int i = 0; i < n; i++)
	{
		printf("Enter word nr %d: \n", i + 1);
		list[i] = (char*)malloc(80);
		memset(list[i], 0, 80);
		chars += scanf_s("%s", list[i], 80);
	}
	char sep[] = ", ";
	char* buf = (char*)malloc(sizeof(char) * chars + 10 * n * 2);
	memset(buf, 0, sizeof(char) * chars + 10 * n * 2);
	char* c = join_words(sep, list, n, buf);
	printf(c);
}