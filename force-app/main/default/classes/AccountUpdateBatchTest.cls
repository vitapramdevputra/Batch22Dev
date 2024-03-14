@isTest
public class AccountUpdateBatchTest {
    
    @isTest
    private static void testBatch1() {
        //prepare data
         List<account> listAcc = new list<account>();
         for(integer i = 0; i<200; i++){
             account acc = new account();
             acc.name = 'SoftInnovas ' + i;
             listAcc.add(acc);
         }
         for(integer i = 200; i<300; i++){
             account acc = new account();
             acc.name = 'SoftInnovas ' + i;
             acc.Active__c = 'No';
             listAcc.add(acc);
         }
         insert listAcc;

         Test.startTest();
         //execute batch
         AccountUpdateBatch ab = new AccountUpdateBatch(); //new instance of batch class
         //Database.executeBatch(ab, 60);//we cannot divide the records in TEST class.
         Database.executeBatch(ab, 350); //maximum chunk should be 1 from test class.

         Test.stopTest();

         //assert
         List<account> allAcc = [select id, name, description,Active__c from account];
         
         for (account eachAcc : allAcc) {
             if(eachAcc.Active__c != 'No'){
                Assert.isTrue(eachAcc.Description.contains('batch'));
             } else {
                Assert.isNull(eachAcc.Description);
             }
             
         }
    }
}