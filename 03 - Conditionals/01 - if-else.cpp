/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

/*
    Remeber, we are including stdio.h
    file. Because we use printf function
    somewhere in the code. printf is a library
    function to print some text. When you include
    stdio.h, the file contains the definations of
    printf function.
*/
#include <stdio.h>

int     main() {
    int x = 10, y = 20;

    /*
        If x is bigger than y, print "X is biG"
    */
    if (x > y) {    /*  if x is bigger than y */
        printf("X is BIG!");
    }

    /*
        If y is bigger than x, print "Y is BIG"
    */
    if (y > x) {
        printf("Y is BIG");
    }

    /* ------------------------------------------*/

    /*
        Let's combine the above two...
    */
    if (x > y) {    /* if x is bigger than y then */
        printf("X is BIG!");
    } else {        /* otherwise... */
        printf("Y is BIG!");
    }


    /* -------------------------------------------*/

    /*
        Below finds the BIG number from three variables
    */
    int a, b, c;
    a = 18;
    b = 15;
    c = 19;

    /*
        If-else can be implemented inside another if-else
        for example...
    */
    if (a > b) {        // a is bigger than b
        if (a > c)  {   // now, is a also bigger than c?, if yes then
            printf("A is BIG");
        } else {        // Otherwise C is bigger, right?
            printf("C is BIG");
        }
    } else {            // b is bigger than a
        if (b > c)  {   // now, is b also bigger than c? if yes then
            printf("B is BIG");
        } else {        // Otherwise c is big
            printf("C is BIG");
        }
    }


    /*--------------------------------------------*/

    /*
    Example of else-if
    Below, is a program to check GPA
    */
    int marks = 74;

    if (marks >= 80) {
        printf("A+");
    } else if (marks >= 70) {
        printf("A");
    } else if (marks >= 60) {
        printf("B");
    } else if (marks >= 50) {
        printf("C");
    } else if (marks >= 40) {
        printf("D");
    } else {
        printf("F");
    }
}
