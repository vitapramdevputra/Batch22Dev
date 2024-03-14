public class ListForEachLoopDemo {
    public static void demo1() {
        List<Integer> list2 = new list<integer>();
        list2.add(10);//0
        list2.add(15);//1
        list2.add(55);//2
        list2.add(15);//3
        list2.add(75);//4
        list2.add(75);//5
        Integer randomNumber = Integer.valueof((Math.random() * 100));
        list2.add(randomNumber);//6

        system.debug('random integer list: ' + list2);

        //if integer is more than or equal to 50 print Big Int
        //if less than 50 print Small Int
        for(integer eachInteger : list2){
            string printStr; //null
            if (eachInteger >= 50) {
                printStr = 'Big int';
            } else {
                printStr = 'Small Int';
            }
            system.debug(eachInteger + ': ' + printStr);
        }
    }

    public static integer add(list<integer> listInt){
        integer sum = 0;

        for (Integer eachInteger : listInt) {
            sum += eachInteger;
            system.debug('--> sum inside for each loop: ' + sum);
        }
        return sum;
    }

    public static void add(){
        list<string> list1 = new list<string>{'apple', 'green apple', 'yellow apple', 'sinaf apple', 'pine apple'};
        //apple || green apple || yellow apple

        string finalString = '';
        for (String eachStr : list1) {
            finalString += eachStr + ' || ';
        }
        system.debug('final string is ==> ' + finalString.removeEnd(' || '));
    }
}