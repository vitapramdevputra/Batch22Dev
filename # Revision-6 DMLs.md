# Revision-6 DMLs

# DML - Data manipulation language

- Insert
- Update
- Delete
- Undelete

## Insert

- used to create records in salesforce using apex
- steps or syntax
    ~~~
    //create new instance of object
    Contact c1 = new Contact();
    //set all fields. Or at least required fields.
    c1.LastName = 'McDonald';
    //dml statement
    insert c1; //it will create record in db. And automatically assign id to c1 variable.

    ~~~

## Update

- used to update records.
- if we want to update any record then we MUST have id somehow.
    - to get record id we select record by querying
    - Syntax
        ~~~
        Contact c2 = [select id, name from contact where lastname = 'McDonald' limit 1];
        c2.firstName = 'Ron';
        c2.lastName = 'McDonalds';
        c2.email = 'ron@gmail.com';

        update c2;

        ~~~

## Insert related data

- create parent record and its child record both
    - account-contact, account-case, account-opportunity
    - department-employee, project-ticket
    - How can we insert related data?
        ~~~
        Account acc = new account(name='revision6');
        insert acc;

        Opportunity opp = new Opportunity();
        opp.name = 'revision 6 opp';
        opp.closedate = date.today();
        opp.stageName = 'Prospecting';
        opp.accountid = acc.id;
        insert opp;
        ~~~

## Bulkify
- Process multiple data (bulk data - bulikying)
    ~~~
    //will below code work? This will work, but we SHOULD NOT EVENT THINK ABOUT THIS.
    for(integer i=0; i< 25; i++){
        Employee__c emp = new employee__c(first_name__c = 'Rev'+i, last_name__c='six', salary__c='15000');
        insert emp;
    }

    List<employee__c> empList = new list<employee__c>();
    for(integer i=0; i< 25; i++){
        Employee__c emp = new employee__c(first_name__c = 'Rev'+i, last_name__c='six', salary__c='15000');
        empList.add(emp);
    }
    insert empList;

    ~~~

- Update multiple data
    ~~~
    List<contact> allContacts = [select id, name, email, phone, account.phone from contact]; 
    //if contact's phone is blank then update it with account's phone

    List<contact> updateContacts = new list<contact>();

    for(contact eachCon: allContacts){
        if(string.isBlank(eachCon.Phone)){
            //assign contact's phone as accounts phone
            //eachCon.phone = account's phone
            eachCon.phone = eachCon.account.Phone;
            updateContacts.add(eachCon)
        }
    }
    //it is NOT ideal to update all Contacts here, so we are updating another list
    if(!updateContacts.isEmpty())
        update updateContacts; 
    ~~~


## Delete, Undelete

- Delete
    - `delete [select id from account limit 5];`
    - deleted data goes to recyle bin

- Undelete
    ~~~
    List<account> getAcc = [select id from account where isDeleted = true ALL ROWS];
    undelete getAcc;
    ~~~


