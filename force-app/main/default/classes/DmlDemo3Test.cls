@isTest
public class DmlDemo3Test {


    @TestSetup
    static void makeData(){
        //create 1000 accounts
        List<account> listAcc = new list<account>();
        for(integer i = 0; i<1000; i++){
            account acc = new account();
            acc.name = 'SoftInnovas ' + i;
            listAcc.add(acc);

        }
        insert listAcc;
    }


    @isTest
    static void testDml13() {
        //heapsize is 6 mb, all other limits are reset already.

        //1. prepare data 
            //data is already prepared from testSetup

        //we consume some governor limits
            //our actual method will have less resources to execute
        
        //ex: consumed 3 MB heapsize. 50 Dmls

        Test.startTest();
        //limit is reset. So now, heapsize is again 6 mb, and DML is also 150
        //2. call method
        DmlDemo3.dml13(); //sometimes we run into error of limitException.

        Test.stopTest();

        //limit will continue from before startTest.
            //so we again have just 3MB heapsize left, and 100 dmls left.
        //3. assertion
        List<account> accs = [select id, name, active__c from account where Active__c = 'Yes'];
        assert.areEqual(90, accs.size());
    }

    @isTest
    private static void testDml14() {
        //directly we cannot use records from any other test methods

        //1. prepare data
            //already prepared in testSetup

        DmlDemo3.dml14();

        //3. assertion
        List<account> allAcc = [select id, name, active__c from account where Active__c = 'No'];
        Assert.areEqual(1000, allAcc.size());
    }
}