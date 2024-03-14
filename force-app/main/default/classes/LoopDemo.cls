public class LoopDemo {
   public void print_1_while(){
        //print 1, 10 times
        
        //1. initialize the counter
        integer i = 1;

        //2. while loop with exit condition
        while (i <= 10) {
            system.debug(1);
            //3. increment or decrement the counter
            i++;
        }
   }

   public void print_int_while(){
        //1. init number
        integer count = 0;

        //2. while with condition
        while (count < 5) {
            //3. increment
            count++;
            system.debug(count);
        }

        system.debug('after a while, value of count is ' + count);
   }

   public void printHello(){
        for (Integer i = 0; i < 5; i++) {
            system.debug('Hello');
        }
   }
   public void printIntegers(integer n){
        //print integer from 1 to n
        if (n < 0) {
            n = n * -1;
            system.debug('n ' + n);
        } 
        for (Integer i = 1; i <= n; i++) {
            system.debug(i);
        }
   }
   public void printOddIntegers(integer startInt, integer endInt){
        //print odd numbers between start and end integer

        integer newStart;
        integer newEnd;
        //start = 4, end =12

        //using if else to determine small number to be newSTART, and big number to be newEND
        if (startInt <= endInt) {
            newStart = startInt;
            newEnd = endInt;
        } else {
            newStart = endInt;
            newEnd = startInt;
        }
        
        for (Integer i = newStart; i <= newEnd; i++) {
            //find if i is odd
            //find odd by dividing number with 2 and see if it has remainder
                //(i % 2) == 1
            integer remainder = Math.mod(i, 2);
            if (remainder == 1) {
                system.debug(i);
            }
        }
   }
}