@isTest
public with sharing class AccountTriggerHandlerTest {
    @isTest
    private static void testUpdateDescription1() {
        Account ac = new account();
        ac.name  = 'test whatever';
        ac.Active__c = 'Yes';
        insert ac;
            //dml will call trigger
                //trigger will call handler's updateDescription method
                    //in updateDescription method it will check if condition active == yes
                        //it will be true so description will be updated.
        
        //assert if description is changed.
        account acc = [select id, name, description from account where id = :ac.Id];
        Assert.areEqual('Account is now active. Enjoy buddy.', acc.Description);
    }

    @isTest
    private static void testUpdateDescription2() {
        // Test data setup
        List<account> listAcc = new list<account>();
        for(integer i = 0; i<200; i++){
            account acc = new account();
            acc.name = 'SoftInnovas ' + i;
            listAcc.add(acc);

        }
        //this is part of calling method
        insert listAcc;
    
        // Actual test
        Test.startTest();
        for (account acc : listAcc) {
            acc.Active__c = 'Yes';
        }
        update listAcc;
    
        Test.stopTest();
    
        // Asserts
            //verify if description is updated.
        List<account> accounts = [select id, name, active__c,Description from account where Active__c = 'Yes'];
        assert.areEqual(200, accounts.size());
        for (account a : accounts) {
            assert.isTrue(a.Description.containsIgnoreCase('enjoy'));
        }
    }

    @isTest
    private static void testVIP1() {
        //prepare data
            //account records
        Account ac = new account();
        ac.name  = 'test whatever';
        ac.Active__c = 'Yes';
        insert ac;
            //contact records
        Contact con = new Contact();
        con.lastName = 'test 1';
        con.AccountId = ac.id;
        
        Contact con2 = new Contact();
        con2.lastName = 'test 2';
        con2.AccountId = ac.id;

        List<Contact> listCon = new List<Contact>{con, con2};
        insert listCon;
        
        //test 1
            //change VIP to true for account
        ac.VIP__c = true;
        update ac;
        
        //assert
            //query contact records
        
        list<contact> contacts = [select id, name, vip__c from contact where accountid = :ac.id];
        assert.areEqual(2, contacts.size());
        //verify if VIP is true for all contact's of account
        assert.areEqual(true, contacts[0].vip__c);
        
        
        //test 2
            //change VIP to false
        ac.VIP__c = false;
        update ac;
        
        //assert
            ////query contact records
        list<contact> contacts2 = [select id, name, vip__c from contact where accountid = :ac.id];
        assert.areEqual(2, contacts2.size());
        //verify if VIP is false for all contact's of account
        assert.areEqual(false, contacts2[0].vip__c);
    }

    @isTest
    private static void privateTest() {
        AccountTriggerHandler.somePrivateMethod();//we can call this private method 
    }

    @isTest
    private static void privateTest2() {
        AccountTriggerHandler.someReallyPrivateMethod();//we can call this private method 
    }
}