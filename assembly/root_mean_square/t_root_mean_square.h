extern float root_mean_square(float a, float b, float c);

void test_root_mean_square()
{
	/* root mean square */
	float a = 0.0;
	float b = 3.0;
	float c = 4.0;
	float rms = root_mean_square(a, b, c);
	printf("\nRMS from %f, %f, %f = %f", a,b,c, rms);
}