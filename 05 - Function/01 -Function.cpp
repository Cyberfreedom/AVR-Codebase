/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

#include <stdio.h>

/*
    main() is a function. This is the function that is called by
    the compiler when you press RUN.

    We can also implement our function.
    the syntax is

    <return_type> <function_name>( <function_input> ) {
        // imlementation code
    }

    below this function take two input, adds them and return
    the result to the caller.
*/

int     add(int x, int y) {
    int sum = x + y;


    /* return is a syntax used to return back the result */
    return sum;
}

/*
    If you need nothing to return, then use void as return type.
    Ex.
*/

void    printHello() {

    printf("Hello!");

}

int     main() {

/*
    Let's call the add function from the main function
*/
    int result;

    result = add(2,3);  // result is taking the return value from add()

    printf("%d ", result);

    /*
        printHello() function take no input and return no output, thus
    */
    printHello();   /* Will print "Hello!"*/

}
