@isTest
public class AccountTriggerTest {
  @isTest
  private static void test1() {
    //prepare data
      List<account> listAcc = new list<account>();
        for(integer i = 0; i<200; i++){
            account acc = new account();
            acc.name = 'SoftInnovas ' + i;
            listAcc.add(acc);

        }
        //this is part of calling method
        insert listAcc;

        //assert if 200 accounts created
        //query account records
        List<account> accounts = [select id from account where name like '%SoftInnovas%'];
        Assert.areEqual(200, accounts.size());

        for (Account eachAcc : listAcc) {
            eachAcc.Phone = '484848411';
        }
        update listAcc;

        //assert if phone updated in all accounts
        List<account> accounts2 = [select id, phone from account where phone = '484848411'];
        Assert.areEqual(200, accounts2.size());
  }
}