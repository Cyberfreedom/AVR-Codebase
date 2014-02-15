/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

int     main() {
/*
    Array: How to declare an array

    <type_name> <array_name>[<array_size>]
    example below creates an integer type array
*/

    int studentMarks[100];  // This is an array, holds 100 of
                            // of variables of type int


/*
    How to access an individual element.

    Ex. below, sets 33 on 10th student
*/
    studentMarks[9] = 33;   // Remeber, array count starts from 0
                            // so, studentMarks[9] is the 10th student



/*
    String: Very special type of array. Holds a sentence or multiple sentences.
    This is a charecter type array with having '\0' or NULL charecter at the last
    byte of the text.

    Ex. 'H', 'E', 'L', 'L', 'O', '\0'

    Remember, a string is quted with double qute " and the NULL charecter is placed
    at the last automatically when assigning.

    Below creates a string with 100 byte long. But use only 6 byte for storing HELLO
    + a NULL charecter
*/
    char    aSimpleString[100] = "HELLO";


}
