public class AccountUpdateBatch implements Database.Batchable<sObject>, database.stateful {

    /*
 must implement the method: System.Iterable<SObject> Database.Batchable<SObject>.start(Database.BatchableContext) (1:14)
 must implement the method: void Database.Batchable<SObject>.finish(Database.BatchableContext) (1:14)                   
 must implement the method: void Database.Batchable<SObject>.execute(Database.BatchableContext, List<SObject>) (1:14)
    */

    public integer totalAccUpdated = 0; //by default batch will re-instantiate the class variables.

    public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('**START method called**');
        Database.QueryLocator allAcc = Database.getQueryLocator([select id,name, active__c, description from account]);
        return allAcc;
    }

    public void execute(Database.BatchableContext bc, List<account> accs){
        system.debug('**EXECUTE method called**');
        system.debug('# of account records: ' + accs.size());
        list<account> updateAccounts = new list<account>();
        for (Account eachAcc : accs) {
            //filtering accounts with active= yes, and active=null
            if(eachAcc.Active__c != 'No'){
                eachAcc.Description += '...updated via batch.';
                updateAccounts.add(eachAcc);
            }
        }
        //if the list is NOT empty
        if (!updateAccounts.isEmpty()) {
            update updateAccounts;
            totalAccUpdated += updateAccounts.size();
            system.debug('** # of updatedAccounts**' + updateAccounts.size());
            system.debug('** # of totalAccUpdated**' + totalAccUpdated);
        }

    }

    public void finish(Database.BatchableContext bc){
        system.debug('all done. finish method.');
        system.debug('** # of total account record processed**' + totalAccUpdated);
    }
}