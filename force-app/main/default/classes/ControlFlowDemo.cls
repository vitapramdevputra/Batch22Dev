public class ControlFlowDemo {
    public void checkBigger(integer a, integer b){
        if(a > b){
            system.debug('a ' + a + ' is bigger than b ' + b );
        } else {
            system.debug('b ' + b +' is same or bigger than a ' + a);
        }
    }

    public void checkNumber(integer x){
        if (x > 0) {
            //the number is positive
            system.debug('..positive..');
            //check if x is odd or even
            //in JS =>  (x % 2) = (10 % 2) =0 => even (2,4,6,8,10)
                //11 % 2 => 1 ==> odd (1,3,5,7)
            integer remainder = Math.mod(x, 2);
            if (remainder == 0) {
                system.debug('x ' + x +  ' is even');
            } else {
                system.debug('x ' + x +  ' is Odd');
            }
        } else {
            if(x == 0){
                system.debug('zero');
            } else {
                system.debug('negative');
            }
        }
    }
}