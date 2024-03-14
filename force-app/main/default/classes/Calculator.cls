public class Calculator {
    //# of parameters: 2
    //datatype of parameters: integer, integer
    //return type is also integer
    public integer add(integer a, integer b){
        integer sum = a + b;
        return sum;
    }

    public integer add(integer a, integer b, integer c){
        integer sum = a+b+c;
        return sum;
    }

    public string add(string a, string b){
        return a+b;
    }

    public decimal add(Decimal a, decimal b){
        return a+b;
    }

    public integer add(list<integer> listInt){
        integer sum = 0;

        for (Integer eachInteger : listInt) {
            sum += eachInteger;
            system.debug('--> sum inside for each loop: ' + sum);
        }
        return sum;
    }
    

}