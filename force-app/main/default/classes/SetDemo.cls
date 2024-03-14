public class SetDemo {


    public static void citySet() {

        set<string> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Tokyo');
        cities.add('TOKYO');
        cities.add('Nairobi');
        system.debug('set of cities ==> ' + cities);
    }

    public static void deDuplicateList(){
        list<integer> L1 = new list<integer> {10,15,21,15,10,15,25,21};
        system.debug('list of integer size ==> ' + l1.size());//8

        set<integer> s1 = new set<integer>();
        s1.addAll(L1);//add all elements of L1 list in s1 set.
        //addAll method is present in List and in Set both. And we can add all the elements from one list or set in another list or set.
        system.debug('set s1 ==> ' + s1);
        system.debug('set size ==> ' + s1.size());
    }
    public static set<integer> deDuplicateList(list<integer> listInteger){
        set<integer> s1 = new set<integer>();
        s1.addAll(listInteger);
        return s1;
    }

    public static void upperCaseSet() {

        set<string> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Tokyo');
        cities.add('TOKYO');
        cities.add('Nairobi');
        system.debug('set of cities ==> ' + cities);


        set<string> citiesInCaps = new set<string>(); //convert all elements in capital and add in this set.
        //iterate cities set, convert each element to uppercase and add it in new set.

        set<string> newSet = new set<string>();
        for (String eachCity : cities) {
            string tempStr = eachCity.toUpperCase();
            citiesInCaps.add(tempStr);
            //citiesInCaps.add(eachCity.toUpperCase());
            if (tempStr.length() > 5) {
                newSet.add(tempStr);
            }
        }

        system.debug('cities in capital: ' + citiesInCaps);
        system.debug('new set ==> ' + newSet);
    }

}