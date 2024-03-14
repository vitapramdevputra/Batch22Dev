Account a1 = new Account();
a1.Name = 'acc 1';

Account a2 = new Account();
a2.Name = 'acc 2';

Account a3 = new Account();
a3.Name = 'acc 3';

Account a4 = new Account();
Account a5 = new Account();

List<account> newAcc = new list<account>{a1, a2, a3, a4, a5};

//insert newAcc; //how many records will be inserted?

//insert(list, allOrNothing)
    //allOrNothing = true; if all the records are good guys, then insert all. If any one is bad guy then DON'T insert ANY.
    //allOrNothing = false; insert good guys, don't insert bad ones.
//Database.insert(newAcc, true); //similar to normal insert

List<Database.SaveResult> results = Database.insert(newAcc, false); //this returns list<databse.saveResult>
//we will get 5 result. 3 success, and 2 error.
for(Database.SaveResult eachResult: results){
    if(eachResult.isSuccess()){
        system.debug('Acc successfully created: Acc Id is: ' + eachResult.getId());
    } else {
        system.debug('FAILED to INSERT. Error: ' + eachResult.getErrors());
    }
}
