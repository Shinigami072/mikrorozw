//
// Created by shinigami on 04/06/19.
//
#include <stdio.h>

long int sum_ascii(char *str, int a, int b, int charset, int *count);

int main() {
	char arg1[] = "0123456789ABCZabcz";
	int a = 0;
	int b = 24;
	int charset = 0;
	int i=-1,res;
	printf("Argument 1: %s\n", arg1);
	printf("Argument a: %d\n", a);
	printf("Argument b: %d\n", b);
	printf("charset   : %d\n", charset);
	res = sum_ascii(arg1, a, b, charset, &i);
	printf("out 1: %ld\n %d\n", res, i);
	charset=1;
	printf("charset   : %d\n", charset);
	res = sum_ascii(arg1, a, b, charset, &i);
	printf("out 1: %ld\n %d", res, i);
	charset=2;
	printf("charset   : %d\n", charset);
	res = sum_ascii(arg1, a, b, charset, &i);
	printf("out 1: %ld\n %d\n", res, i);
	charset=3;
	printf("charset   : %d\n", charset);
	res = sum_ascii(arg1, a, b, charset, &i);
	printf("out 1: %ld\n %d\n", res, i);
	charset=4;
	printf("charset   : %d\n", charset);
	res = sum_ascii(arg1, a, b, charset, &i);
	printf("out 1: %ld\n %d\n", res, i);
	return 0;
}
