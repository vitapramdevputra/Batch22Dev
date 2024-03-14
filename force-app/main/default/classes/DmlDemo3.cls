public class DmlDemo3 {
   public static void dml13() {
        //update 90 account records created this week.
        List<account> newAccounts = [select id, name, active__c, description from account where createddate = THIS_WEEK limit 90];
        
        for (Account eachAcc : newAccounts) {
            eachAcc.Active__c = 'Yes'; //this is correct.
            
            //update eachAcc;//how many total dmls? maximum 90
        }
        update newAccounts;
   }
   public static void dml14() {
        //update accounts active = no if not already yes
        //196 record in list -> we want to update 80
        List<account> newAccounts = [select id, name, active__c, description from account where createddate = THIS_WEEK];
        List<account> updateAcc = new list<account>();
        //looping 196 records
        for (Account eachAcc : newAccounts) {
            if (string.isBlank(eachAcc.Active__c)) {
                //80 account records
                eachAcc.Active__c = 'No';
                updateAcc.add(eachAcc);
            }
        }

        //update newAccounts;//updating 196 records. This is a little wrong.

        //check if list is NOT EMPTY
        if(!updateAcc.isEmpty())
            update updateAcc; //updating JUST 80 records.

   }
}