# Revision-2 operator, conditions, loops

# Operator

- Comparision operators
    - `==`, `!=`, `<`, `<=`, `>`, `>=`
- Logical operators
    - `&&`, `||`, `!`(not)
- Assignment operators
    - `=`, `+=`, `-=`, `++`, `--`

- Conditional statements
    - if/else
        ~~~
        string s = 'apex';
        if(s){ //inside if we cannot pass string. NOT VALID.
            system.debug('print s ' + s);
        }

        //equals condition
        if(s == 'apex'){//we must always have boolean inside if
            system.debug('s is apex. s => ' + s);
        }
        
        if(!string.isEmpty(s)){
            system.debug('s ==> ' + s);
        }

        //if/else
        if(string.isEmpty(s)){
            system.debug('s is empty');
        } else {
            system.debug('s is not empty. s ==> ' + s);
        }

        //if else if
        if(string.isEmpty(s)){
            system.debug('s is empty');
        } else if(s.equals('apex')){
            system.debug('s vale is apex');
        } else {
            system.debug('s is not empty, not apex, s is ' + s);
        }
        ~~~
- Switch
    - sample code
    - datatype that can be used in expression? 
        - string, integer, long, sObject
    ~~~
        switch on expresssion{
            when value1{

            }
            when value2 {

            }
            when value3, value4{//more than one value is possible

            }
            when else{

            }
        }
    ~~~
    - can we if/else inside switch?
        - yes.
    - can we provide range in switch or conditions using `>` or `<`?
        - NO.
    - When to use switch vs when to use if else if?
        - we use switch when we are comparing with JUST one variable and it is not ranges of integers, then we use switch.
        - if we have more than one variable comparision then use if/else
    
- Loops
    - while and fori (traditional for loop)
    - Samples
        ~~~
        while(boolean_condition){
            //it will keep on executing till the boolean condition is true
        }
        

        integer i = 0;
        string printStr = '';
        while(i <= 5){
            printStr += i + ',';
            //system.debug(printStr);
            i++;
        }
        system.debug('final => ' + printStr.removeEnd(','));
        ~~~

        ~~~
        for(initialize; exit_condition; increment/decrement){
            //logic
        }


        //print all odd numbers in one line comma separated.
        string oddStr = '';
        for (Integer i = 0; i <= 10; i++) {
            //find if i is odd
            //find odd by dividing number with 2 and see if it has remainder
                //(i % 2) == 1
            integer remainder = Math.mod(i, 2);
            if (remainder == 1) {
                //system.debug(i);
                oddStr += i + ',';
            }
        }
        system.debug('Odd String is ' + oddStr);
        ~~~
