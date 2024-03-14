@isTest
public with sharing class DmlDemo2Test {
    @isTest
    private static void testDml7() {
         //1. prepare data
            //what data we need to prepare to test dml7?
                //either we have to create account or contact or both. 
            //prepare account record with name 'softinnovas'
        Account acc = new account(name = 'softinnovas');
        insert acc;

        //2. call method
        DmlDemo2.dml7();

        //3. assertion
            //how do we assert if our method ran successfully?
                //query first. what do query?
                //we query contact
            List<contact> listContact = [select id, lastname, accountid from contact where lastname = 'Biden'];
            Assert.areEqual(1, listContact.size());
            Assert.areEqual(acc.Id, listContact[0].AccountId);
        
    }
}