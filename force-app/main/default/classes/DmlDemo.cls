public class DmlDemo {
    //insert account record
    public static void dml1() {
        //1. create new instance
        Account acc = new Account();
        //2. set field values
        acc.Name = 'Softinnovas';

        //to create new account. 
        insert acc;
    }

    //insert salesforce project record
    public static void dml2() {
        //new instance
        Salesforce_Project__c sp = new Salesforce_Project__c();
        //set all fields
        sp.Project_Name__c = 'Learn DML';
        sp.Status__c = 'New';
        sp.Description__c = 'DML is very very easy';
        system.debug('before insert statement: ' + sp);
        //insert
        insert sp;
        system.debug('AFTER insert statement: ' + sp);
    }

    //insert employee record
    public static void dml3(){
        Employee__c emp = new Employee__c();
        emp.First_Name__c = 'W';
        emp.Last_Name__c = 'Loyd';
        emp.Salary__c = 500000;
        emp.Country__c = 'AUS';
        emp.JoinDate__c = date.today();
        emp.Email__c = 'w.loyd@ggmail.com';
        insert emp;
    }

    public static void dml4updateWrong() {

        Account acc = new account();
        //NEVER use hard coded ids in apex. Because id changes from one org to another (sandbox to production), so we never hardcode ids. If ID is not found in the org, it won't work.
        acc.Id = '001Ho00001JY8YeIAL'; //hard coded ID.

        acc.Name = 'More Store Company';
        acc.Phone = '654321654';
        acc.Website ='more.store';
        //update DML
        update acc;
        
    }

    public static void dml5UpdateRight(){
        //update latest created account record
        Account latestAcc = [select id, name from account order by createddate limit 1];
        
        latestAcc.name = 'The Latest company';
        latestAcc.Website = 'latest.com';
        latestAcc.Phone = '9999111155';
        
        update latestAcc;
    }
}