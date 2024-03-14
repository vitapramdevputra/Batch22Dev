system.debug('index 3 of listcandidates: ' + ListDemo.listCandidates(3));
system.debug('index 5 of listcandidates: ' + ListDemo.listCandidates(5));

system.debug('index 10 of listcandidates: ' + ListDemo.listCandidates(10)); //we need to solve this. 

system.debug('index -2 of listcandidates: ' + ListDemo.listCandidates(-2));

ListDemo.listCandidates();
listDemo.randomIntegerList();


list<integer> list1 = new list<integer>();//create empty list
list1.add(15);

if(!list1.isEmpty()){
    system.debug(list1);
}


List<integer> list2 = new list<integer> { 15,25,15,25,15,25 };
list2.add(55);
list2.add(9);
system.debug('before sort : '  + list2);
list2.sort();
system.debug('after sort: ' + list2);


list<string> friends = new list<string> {'Ross', 'Monica', 'Chandler', 'Joey', 'Rachel', 'Phoebe', 'ross', 'monica', 'chandler', 'joey'};
system.debug('before : '  + friends);
// friends.sort();
// system.debug('after sort: ' + friends);
friends.remove(0);
system.debug('after remove(0) : ' + friends);

integer indexOfChandler = friends.indexOf('Chandler');
integer indexOfChandler2 = friends.indexOf('chandler');
system.debug('indexOfChandler ==> ' + indexOfChandler);
system.debug('indexOfChandler2 ==> ' + indexOfChandler2);
friends.remove(indexOfChandler);
system.debug('final friends: ' + friends);


//contains returns boolean
if(friends.contains('chandler')){
    system.debug('chandler is present.');
} else {
    friends.add('chandler');
}




list<string> friends1 = new list<string> {'Ross', 'Monica', 'Chandler', 'Joey', 'Rachel', 'Phoebe', 'ross', 'monica', 'chandler', 'joey'};
list<string> friends2 = new list<string> {'Chandler', 'Joey', 'Rachel', 'monica', 'chandler', 'joey', 'Ross', 'Monica', 'Phoebe', 'ross' };

boolean checkEquals = friends1.equals(friends2);//true or false?
system.debug('check if two list are equal : ' + checkEquals);
