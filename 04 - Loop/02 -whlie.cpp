/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

#include <stdio.h>

int     main() {
    /*
        loops are program lines that executes many many times
        with proper condition.
    */

    int i;

    /*
        Let's say, we want to print "HELLO WORLD" 10 times.
        So, the coding would be...

            if HELLO WORLD printing is less than 10 times,
            keep printing HELLO WORLD

        Using the while loop syntax, that would be,

        while (<some_condition_met_for_loop>) {
            // some codes to run
        } // then go to that condition

        Below is sample,
    */

    i = 0; /* init i to 0 */

    while (i < 10) {
        printf("Hello world");

        i = i + 1;  // i is increased by 1
    }
}
