ListForEachLoopDemo.demo1();
list<integer> list1 = new list<integer>{2,9,25,35,51,88,99};
integer sum1 = ListForEachLoopDemo.add(list1);
system.debug('sum1 is ' + sum1);

ListForEachLoopDemo.add();




list<integer> list2 = new list<integer>{2,9,25};
list<integer> list3 = new list<integer>();

for (Integer eachInt : list2) {
    integer newInteger = eachInt * 10;
    list3.add(newInteger);
}
system.debug('list2: ' + list2);
system.debug('list3: ' + list3);
//if we want to add all elements of list3 in list2, we use addAll method
list2.addAll(list3); //adding all elements of list3 in list2.
system.debug('updated list2: ' + list2);
