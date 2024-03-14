@isTest
public class SalesforceProjectTriggerHandlerTest {
    
    @isTest
    private static void testFuture1() {
        //to test async apex, we must use Test.startTest() and Test.stopTest()

        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'test test';
        sp.Description__c = 'test';
        sp.Status__c= 'New';

        Test.startTest();
        insert sp; 
        Test.stopTest(); //this will ensure that future method is completed. And we can assert the future method's output

        Salesforce_Project__c updatedSP = [select id, description__c from Salesforce_Project__c where id = :sp.Id];
        Assert.isTrue(updatedSP.Description__c.contains('Updated from future')); //this is updated from future. (So the assertion will fail if test.startTest and test.stopTest is not present).
    }
}