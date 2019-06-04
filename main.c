#include <stdio.h>
long long facta( unsigned int k );

char *binary_op(char* res, char* arg1, char* arg2, int oper);

int z1(){
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
long int sum_ascii(char* str,int a,int b,int charset,int*count);
int z2(){
	char arg1[] = "023000";
	int i=-1;
	printf("Argument 1: %s\n",arg1);
	printf("Argument 2: %d\n",1);
	printf("Argument 3: %d\n",3);
	printf("Argument 4: %d\n",0);
	int res = sum_ascii(arg1,1,3,0,&i);
	printf("out 1: %ld\n %d",res,i);
	return 0;
}
int encode(char *str, int charset, int case0 );
int z3(){
	char str[] = "To jest tekst do zaszyfrowania. A to cyferki 0123456789";
	int charset = 0;
	int case0 = 0;
	printf("Original string: %s\n", str );
	printf("Charset: %d\n", charset );
	printf("Case   : %d\n", case0 );
	printf("Encoded string : %d\n", encode( str, charset, case0 ) );
	return 0;

}

int main() {
//	printf("Hello, %lld \n",facta(3));
//	return 0;
	return  z2();
}

