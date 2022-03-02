#include<stdlib.h>

double RandomReal()//unsigned seed
{
	double rand_real;
//	srand(seed);
	rand_real = rand()/(double)RAND_MAX;

	return rand_real;
}