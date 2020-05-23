
1. main function in `c` is written like this:
```
int main(void)
{

}
```

2. to print something we use `printf ("text to print");`
3. to include a library we use `#include <libararyName>` for example `#include <stdio.h>`
4. after writing our program we need to use a *compiler* which is going to translate our code from c to binary.
5. to compile a `.c` file we use `clang` :`clang filename.c`
    1. this will produce a file called `a.out` which we can simply run by `./a.out`
6. we can rename the `a.io` file by using the argument `-o` with clang: `clang -o filename cFileName.c` 
7. if we list the files, the `a.io` file will have an `*` next to it which means it is excutable.
8. in this cs50 class, we can use `get_string` funtion to get the string from the user.
9. to get a string we use `get_string("hint or question to the user")` and we can store it in a variable:
`string answer = get_string("what is your name?\n");`
10. we used `string` before the variable name because in `c` we have to give every variable a type.
11. `=` sign is not for equality but for assignment.
12. to concancate strings in `c` we have to use a place holder `%s` (this one for string) and pass an argument to the `printf` functions.
example: `string answer = get_string("what is your name?");`
`printf("Hellow, %s", answer);`
13. in the class we use `string` as a type but acctually in `c` there is no such a thing and we will learn about that later. 
14. to use this string in this class, we need to include `cs50.h` in the top of our program so we can use this type.
15. also, to use this libarary `cs50.h` we need to link it in the command line by typing `slang -o nameOfApp nameOfCFile.c -lcs50` so we can link them together.
16. in a better and easier way, we can use the command `make cFileName` in the cs50 envirenoment and it will make the app for us
17. this `make` command is not specilized only in this class but we can use it like this: `make nameOfTheCfile` (but without the `.c`) and it will compile the file for us in the same name
18. in vim we can use `make` directly by typing `:make cFileName` (without the `.c`) and then we can run it `! ./filename`
19. we need to give the type of the variable only the first time.
20. to add 1 to the current variable we can use either:
    1. `variableName = variableName + 1;`
    2. `variableName += 1;`
    3. `variableName++;`
21. if statment is written like this:
    ```
    if (x < y)
    {
        printf(x);
    }
    
    else if (x > y)
    {
        printf(y)
    }

    else
    {
        printf("nothing");
    }
    ```
22. loops:
    1. 
        ```
        while (condition)
        {
            statmentes
        }
        ```
    2. 
        ```
        for (int i = 0; i < 50; i++)
        {
            statments
        }
        ```
    3. 
        ```
        do
        {
            loop boddy;
        }
        while (condition);
        ```
        this is one of the way to check input
        
23. logical operators:
    1. `&&` : and
    2. `||` : or
24. functions: 
    ```
    returnType functionName(parametersTypes parametersNames)
    {
        function boddy;
    }
    ```
    and to call it:
    `functionName(parameters);`
    
    c reads top to buttom so we should either put our functions on the top which is bad design.
    or we can put the function defintion on the top of the code (it's called prototype) and then define it after the main function:
    ```
        void myFunction(void);

        int main(void)
        {
            ...
        }

        void myfunction(void)
        {
            functions' boddy;
        }
    ```
25. variable can be not assigned any value (called garpage value) like this: `int n;`
26. cumputers have limitations, so if we tried to devied two numbers for example and we told the computer to print 50 numbers after the dicemal point we will see some inpercision.
27. `sleep()` function can be included using the library `unistd.h`
28. switch:
    ```
        int x =5
        switch(x)
        {
            case 5:
                printf("five");
                break;
            case 4:
                printf("four");
                break;
            case 3:
                printf("three");

                
        }
    ```
    * there is what is called fall through which is if we don't break between cases, then at first true case the program will go through - fall through - all the rest of the cases.
    example: 
    ```
        int x = 5;
        swithc (x)
        {
            case 6:
                printf("six");
            case 5:
                printf("five");
            case 4:
                printf("four");
        }
    ```
    the result of this program will print `case f` and `case 4`

29. we can use *ternary operator* to simulate a very short if statement:
    ```
    int x;
        if (expr)
        {
            x = 5;
        }

        else 
        {
            x = 6;
        }
    ```
    is exactlly the same as:
    `int x = (expr)? 5: 6;`
    wheich translate to x = if expression is true then x = 5, otherwise, x = 6
30. 


# variables types:
    1. string: only in cs50
    2. int: number: 5
    3. char: character: 'h'
    4. bool: boolean: true
    5. double: big real number: (1.3)
    6. float: real number: 30,7
    7. long a big number: 40


# Place holders:
    1. `%c` char
    2. `%f` float, double (we can use `%.2f` to indicate the number of digit after the decimal point)
    3. `%i` int
    4. `%li` long
    5. `%s` string


# cs50 libarary:
        1. `get_char`
    2. `get_double`
    3. `get_float`
    4. `get_int`
    5. `get_long`
    6. `get_string`




