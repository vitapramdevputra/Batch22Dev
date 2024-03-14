Account acc = new Account();
//2. set field values
acc.Name = 'Softinnovas 12 Feb';
acc.Type = 'Prospect';

//to create new account. 
//insert acc; //will it fire trigger is we execute this anonymous code. YES.


Account acc2 = new Account();
//2. set field values
acc2.Name = 'Softinnovas 12 Feb v2';
acc2.Type = 'Customer - Direct';

//to create new account. 
//insert acc2;

List<account> accList = new list<account>{acc, acc2};
insert accList;



Account acc11 = new Account();
Account acc211 = new Account();

List<account> accList11 = new list<account>{acc11, acc211};
insert accList11;




list<contact> list1  = [select id, name, email from contact order by createddate limit 3];
system.debug('list contacts ==> ' + list1);

//save soql as map
Map<id, contact> map1 = new Map<id, contact>([select id, name, email from contact order by createddate limit 3]);
system.debug('map1 of contacts ===> ' + map1);

Map<id, contact> map2 = new Map<id, contact>([select id, phone, leadsource from contact order by createddate limit 3]);
system.debug('map2 of contacts ===> ' + map2);

//get name from map1, and phone from map2
for(Id eachId: map1.keySet()){
    contact c1 = map1.get(eachId);
    contact c2 = map2.get(eachId);
    system.debug('c1.name: ' + c1.Name);
    system.debug('c2.phone: ' + c2.Phone);
}

system.debug('********');

for(Contact c: list1){
    system.debug('c1 name: ' + c.Name);
    id eachId = c.id;
    contact c2 = map2.get(eachId);
    system.debug('c2 name: ' + c2.Phone);
}





