/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

#include <stdio.h>

int     main() {
    /*
        break is used to break the loop by force and immidiate
    */

    int i=0;

    /*
        Below the loop should loops 100 times, but
        breaks at the time of i==50 because of break
    */
    while (i < 100) {
        printf("Hello ");

        if (i == 50) {
            break;
        }

        i = i + 1;
    }

    /*
        For loop implementation
    */
    for (i=0; i<100; i++) {
        printf("Hello ");
        if (i == 50) {
            break;
        }
    }
}
