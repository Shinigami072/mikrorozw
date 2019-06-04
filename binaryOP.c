//
// Created by shinigami on 04/06/19.
//
#include <stdio.h>
char *binary_op(char* res, char* arg1, char* arg2, int oper);

int main(){
	char arg1[] = "111";
	char arg2[] = "101011";
	char res[65];
	int oper = 0;

	printf("Argument 1: %s\n",arg1);
	printf("Argument 2: %s\n",arg2);
	printf("Operation: %d\n",oper);
	char* c = binary_op(res,arg1,arg2,oper);
	printf("Result    : %s\n",c);
	return 0;
}
