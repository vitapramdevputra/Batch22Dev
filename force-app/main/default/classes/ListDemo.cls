public class ListDemo {

    public static void listCandidates() {
        //list of string
            //we can add only string elements in list of string
        
        List<string> newList = new list<string>(); //creating new instance of list<string> which creates empty list
        //how to add elements in list
        newList.add('Marc');
        newList.add('ELon');
        newList.add('Bill');
        newList.add('55');//will this work?
        newList.add('Marc');
        newList.add('Marc');
        system.debug('candidates list ==> ' + newlist);
        
    }


    public static string listCandidates(integer index) {
        //list of string
            //we can add only string elements in list of string
        
        List<string> newList = new list<string>(); //creating new instance of list<string> which creates empty list
        //how to add elements in list
        newList.add('Marc');//0
        newList.add('Elon');//1
        newList.add('Bill');//2
        newList.add('55');//will this work?//3
        newList.add('Marc');//4
        newList.add('Marc');//5
        system.debug('candidates list ==> ' + newlist);

        integer sizeOfList = newList.size(); //5 or 6? 6.
        string valueAtIndex = '';

        //6 --> maximum index is 5
        //7 --> maximum index is 6
            //index = 6
            //6 > 10 ==> false

        if (index >= 0 && index < sizeOfList) {
            valueAtIndex = newList.get(index);
        } else {
            valueAtIndex = 'No value found. Be in limits buddy.';
        }
        return valueAtIndex;

    }

    public static void randomIntegerList() {
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

        //get the value at index 3

        //1st way is to use get method
        integer valueAt3 = list2.get(3);//will return us value at index 3
        system.debug('value at index 3: ' + valueAt3);

        //2nd way is to use [] - sqaure brackets
        integer valueAt5 = list2[5];//will return us value at 5
        system.debug('value at index 5: ' + valueAt5);
    }


}