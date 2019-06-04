//
// Created by shinigami on 04/06/19.
//
#include <stdio.h>

char* encode(char *str, int charset, int case0 );

void testencode(int charset0,int case0){
	char str[] = "To jest tekst do zaszyfrowania. A to cyferki 0123456789";
	printf("Charset: %d\n", charset0 );
	printf("Case   : %d\n", case0 );
	printf("Encoded string : %s\n", encode( str, charset0, case0 ) );
}
int main() {

	for(int charset0=0;charset0<3;charset0++)
		for(int case0=0;case0<3;case0++)
			testencode(charset0,case0);
	return 0;

}
