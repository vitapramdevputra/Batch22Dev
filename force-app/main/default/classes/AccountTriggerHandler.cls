public class AccountTriggerHandler {
    public static void updateDescription(List<account> accTriggerNew, List<account> accTriggerOld, map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
        
        for (Account newAcc : accTriggerNew) {
            //check if insert and if active = yes
            if(Trigger.isInsert && newAcc.Active__c == 'Yes' ){
                //update description (assign some description)
                newAcc.Description = 'Account is now active. Enjoy buddy.';
            }
            if(Trigger.isUpdate){
                //check if active field is changed, and new value of active == yes then update description
                if(newAcc.Active__c == 'Yes' && newAcc.Active__c != accTriggerOldMap.get(newAcc.Id).Active__c ){
                     newAcc.Description = 'Account is now active. Enjoy buddy.';
                }
            }
        }
        
    }

    public static void updateContactsVIP(List<account> accTriggerNew, List<account> accTriggerOld, map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
        //WRONG
            // for (Account newAcc : accTriggerNew) {
            //     //check if VIP is changed
            //     if(newAcc.VIP__c != accTriggerOldMap.get(newAcc.Id).VIP__c){
            //         //update all its contacts
            //         List<contact> accContacts = [select id, name, vip__c from contact where accountid = :newAcc.Id];
            //         for (Contact con : accContacts) {
            //             con.vip__c = newAcc.vip__c;
            //         }
            //         update accContacts;
            //     }
            // }

        set<id> accIds = new set<id>();
        for (Account newAcc : accTriggerNew) {
            //check if VIP is changed
            if(newAcc.VIP__c != accTriggerOldMap.get(newAcc.Id).VIP__c){
                accIds.add(newAcc.Id);
            }
        }

        if(!accIds.isEmpty()){
             //get all contact records of all accounts in accIds
            List<contact> allContacts = [select id, name, accountid, vip__c, account.vip__c from contact where AccountId in :accIds];

            //update contact's vip to match account's vip
            for (Contact eachContact : allContacts) {

                //eachContact.vip__c = true; //NOT CORRECT. Because we need whatever account's vip field value is 
                //eachContact.vip__c = eachContact.account.vip__c; //directly getting it from soql
                //get account's vip field value
                Id accid = eachContact.AccountId;
                system.debug('** accid ==> ' + accid);
                Boolean accVIP = accTriggerNewMap.get(eachContact.AccountId).VIP__c;
                system.debug('** accNewMap ==> ' + accTriggerNewMap);
                system.debug('** accTriggerNewMap.get(eachContact.AccountId).VIP__c ==> ' + accTriggerNewMap.get(eachContact.AccountId).VIP__c);
                
                eachContact.vip__c = accTriggerNewMap.get(eachContact.AccountId).VIP__c;

            }
            update allContacts;
        }
    }

    public static void accUpdateOnUndelete(List<account> accTriggerNew) {
        //in after triggers, trigger.new is READ ONLY.
            //we cannot modify trigger.new in after triggers. The record is already saved in database.
        
        List<account> updateAcc = new list<account>();
        for (Account newAcc : accTriggerNew) {
            //create new instance.
            Account acc = new Account();
            //set id so that we can update account
            acc.Id = newAcc.Id;
            acc.Description = newAcc.Description + '... account undeleted successfully';
            updateAcc.add(acc);
            //newAcc.Description = 'account undeleted successfully';
        }
        update updateAcc;
    }

    @testVisible//to make private methods visible to test class we annotate with @testVisible
    private static void somePrivateMethod(){
        system.debug('** somePrivateMethod called');
    }

    private static void someReallyPrivateMethod(){
        system.debug('** somePrivateMethod called');
    }
}