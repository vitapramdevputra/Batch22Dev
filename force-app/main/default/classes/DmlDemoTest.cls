@isTest
public class DmlDemoTest {
    //what happens in test methods, stays in test method.
        //whenever we do any DMLs in test method, the record is inserted/updated ONLY for that test method. No record is inserted in org. No record is updated in ORG.
        //we don't even read data from org (by default)
            //if we have 1000 accounts in org.
                ///if we write a query in test method (select id from account), how many accounts it will fetch? 0
    
    @isTest
    static void test1(){
        //we cannot access any record from org. So, if our method need any data then we MUST create it here.

        //1. prepare data (if methods needs any data)
        //2. call method which we want to test
        DmlDemo.dml1();
        //3. assertion
        //how to check if data is successfully created?
        //write a soql
        list<account> accs = [select id, name from account where name = 'Softinnovas'];
        Assert.areEqual(1, accs.size());
        Assert.isFalse(accs.isEmpty());
        //Account acc0 = accs[0];
        Assert.areEqual('Softinnovas', accs[0].Name);
        
    }

    @isTest
    static void test2(){
        //1. prepare data (not needed here)
        //2. call method
        DmlDemo.dml2();
        //3. assertion
        //if we have DML, we assert using SOQL
        List<Salesforce_Project__c> sps = [select id, project_name__c, status__c from Salesforce_Project__c where Project_Name__c = 'Learn DML'];
        Assert.areEqual(1, sps.size());
        Assert.areEqual('New', sps[0].Status__c);


    }

    @isTest
    static void test3(){
        //1. prepare data
        Account acc = new Account();
        acc.Name = 'test acc';
        insert acc;

        //2. call method
        DmlDemo.dml5UpdateRight(); //this method will update account name, phone, and website

        //3. assertion
        //we want to assert if name, phone, and website are updated in account.

        Account getAcc = [select id, name, phone, website from account where id = :acc.Id];
        assert.areEqual('The Latest company', getAcc.Name);
        Assert.areEqual('latest.com', getAcc.Website);
        Assert.areEqual('9999111155', getAcc.Phone);

    }
}