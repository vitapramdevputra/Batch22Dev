@isTest
public class AccountQueueableDemoTest {
   @isTest
   public static void testQueue() {
        //prepare data
        List<account> listAcc = new list<account>();
         for(integer i = 0; i<200; i++){
             account acc = new account();
             acc.name = 'SoftInnovas ' + i;
             listAcc.add(acc);
         }
         insert listAcc;


        test.startTest();
        //enqueue queueable
         AccountQueueableDemo apc = new AccountQueueableDemo(listAcc);
         System.enqueueJob(apc);
        test.stopTest();

        //assert
         List<account> accounts = [select id, name from account];
         Assert.isTrue(accounts[0].name.contains('-- SI'));

   }
}