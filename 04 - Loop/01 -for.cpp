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

        Using the for loop syntax, that would be,

        for ( <state_of_the_beginning> ; <some_condition_for_continuing_loop> ; <some_operation_happen_each_loop> ) {
            // Some code to run
        }

        Below is sample,
    */

    for (i=0; i<10; i++) {
        printf("Hello world! ");
    }
}
