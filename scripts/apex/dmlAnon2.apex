//DmlDemo2.dml6Wrong(); Don't try this at home
//DmlDemo2.dml7();
// DmlDemo2.dml8();
//  DmlDemo2.dml9();
// DmlDemo2.dml10();
//DmlDemo2.dml11Wrong();
//DmlDemo2.dml12();
DmlDemo3.dml14();

//delete dml
List<account> accList = [select id from account where createddate = THIS_WEEK and active__c = 'No' limit 40];
delete accList; //record will go to recyle bin
//OR
delete [select id from account where createddate = THIS_WEEK and active__c = 'No' limit 40];

List<account> getDeletedAcc = [select id from account where name = 'less storey' and isDeleted = true ALL ROWS];//will get all records including recycle bin
system.debug(getDeletedAcc.size());
undelete getDeletedAcc; //error because NOT all records in list are deleted




