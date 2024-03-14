//SetDemo.citySet();
SetDemo.upperCaseSet();
SetDemo.deDuplicateList();
list<integer> L1 = new list<integer> {1,2,5,9,9,5,1,5,12,2};
system.debug(L1);
set<integer> s1 = SetDemo.deDuplicateList(L1);
system.debug(s1);

list<integer> L2 = new list<integer> {25, 21, 15, 10,15,21,15,10,15};
set<integer> s2 = SetDemo.deDuplicateList(L2);
system.debug('L2 => ' + L2);
system.debug('s2 => ' + s2);


string s; //null
string ss = ''; //empty

set<integer> s33;//null
set<integer> s3 = new set<integer>(); //empty
boolean s3isEmpty = s3.isEmpty();
system.debug(s3isEmpty);


set<integer> s11 = new set<integer>{3,6,9};
set<integer> s12 = new set<integer>{9,6,3,9,6,3};
system.debug(s11.equals(s12));


