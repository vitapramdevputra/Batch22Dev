# Revision-4 Collections

# List

- What is list?
    - it is ordered collection of elements of same data type.
    - How to create a list?
        - Sample code to create list of string and integer
        `List<string> newList = new list<string>();`
        `List<integer> newList2 = new list<integer>();`
        `List<id> newList3 = new list<id>();`//valid? Yes.
        `List<date> newList4 = new list<date>();`//yes
        - we can also create list of sObject
            `List<account> newList5 = new list<account>();`
                - we store account records in this list.
    - how can we add elements to `newList` and `newList2`?
        - how to get size of list? Or if we want to get a particular index element?

        ~~~
        List<string> newList = new list<string>();
        newList.add('a');
        //newList.add('b', 'c', 'd');//is this valid? NO. 
        newList.add('b');
        newList.add('c');
        newList.add('d');
        newList.add('a');//yes, duplicates are allowed.

        //get index 3 value
        //integer index3 = newList.get(3);//wrong
        string index3 = newList.get(3);//list is of string datatype, it returns ONE element of list which is string.
        newList[3];

        string index10 = newList.get(10);//works? Error. 


        //if we want to add elements while creating list we add using {}
        List<integer> newList2 = new list<integer>{ 5, 10, 15};
        //newList2.add(15.5);//no
        newList2.add(20);
        //Order of elements will be 5,10,15,20 

        integer list2size = newList2.size();//3 or 4? 4. Maximum index will be 3

        ~~~
    - Some more methods of list
        - `sort(), contains(element), indexOf(element), remove(index), clear(), equals(list2), addAll()`
    

- For each loop for list
    - is used to iterate all the elements of list.
    - can a method accept 2 list parameters? `list<string>, list<integer>`
        ~~~
        public class listDemo {
            public static void listMethods(list<string> list1, list<integer> list2){
                system.debug('list1 size ' + list1.size());
                for(string eachStr: list1){
                    system.debug(eachStr);
                }
                system.debug('list2 size ' + list2.size());
                for(integer eachInt: list2){
                    system.debug(eachInt);
                }
            }
        }
        ~~~

        ~~~
        list<string> L0 = new list<string>{'one', 'two', 'ten'};
        list<integer> L1 = new list<integer>{1, 2, 10};
        listDemo.listMethods(L0, L1);
        ~~~

-  Set
    - What is set?
        - collection which has no ordering (so no index), no duplicates (unique) elements.
        - set of primitive datatype, sObjects, classes are allowed.
        - example
            ~~~
            set<string> s1 = new set<string>();
            set<string> s2 = new set<string>{'tomato', 'potato', 'Tomato', 'Potato'};
            //can we add all 
            elements of s2 in s1? Yes.
            s1.addAll(s2);  

            //s1.get(0); //No Way - No index no get     
            //.size();
            //.isEmpty();
            ~~~ 
    - For each loop for set
        ~~~
        set<string> s2 = new set<string>{'tomato', 'potato', 'Tomato', 'Potato'};
        for(string eachStr: s2){
            system.debug('each str :' + eachStr);
        }
        ~~~
- Map
    - What is map?
        - collection of key value pair. where keys are unique, and one key is associated with one value
        - example:
            ~~~
            Map<integer, string> map1 = new map<integer, string>();
            Map<integer, string> map2 = new map<integer, string>{ 1 => 'one', 2 => 'two', 3 => 'thirty', 3 => 'three'};
            map2.put(4, 'four');

            system.debug(map2);

            //how to get value from given key
            integer key1 = 2;
            map2.get(2);

            //to get all keys we use keyset method
            set<integer> allKeys = map2.keyset();
            system.debug(allKeys);

            //to get all values we use values()
            list<string> allValues = map2.values();
            system.debug(allValues);
            ~~~
        - for each loop for map
            ~~~
            //first we get keySet, we do for each loop on keyset and we get individual values
            for(integer eachKey: map2.keySet()){
                //use get(eachKey) method to get each value
                system.debug(eachKey + ' key value is ' + map2.get(eachKey));
            }

            ~~~
        

    
