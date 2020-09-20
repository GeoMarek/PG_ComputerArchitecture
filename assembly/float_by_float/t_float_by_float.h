extern float float_by_float(float a, float b)

void test_float_by_float() 
{
	/* float by float without fpu */
	float a = -7.0f;
	float b = 2.0f;
	float result = float_by_float(a, b);
	printf("\n%f * %f is equal to %f", a,b, result);
}