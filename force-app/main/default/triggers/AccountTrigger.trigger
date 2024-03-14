trigger AccountTrigger on Account (after update, before insert, before update, after insert, before delete, after undelete) {

    TriggerSwitch__c accountSwitch = TriggerSwitch__c.getInstance('Account');
    if(accountSwitch.enabled__c == false){
        return;
    }

    system.debug('---start----');
    
    if(trigger.isBefore){
        if(Trigger.isUpdate || Trigger.isInsert){
            AccountTriggerHandler.updateDescription(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
        }
        if(Trigger.isDelete){
            //validation - if account is active, don't allow to delete
            system.debug('DELETE TRIGGER:  trigger.new: ' + trigger.new);
            system.debug('DELETE TRIGGER:  trigger.newMap: ' + trigger.newMap);
            system.debug('DELETE TRIGGER:  trigger.old: ' + trigger.old);
            system.debug('DELETE TRIGGER:  trigger.oldMap: ' + trigger.oldMap);
            for (Account oldAcc : trigger.old) {
                //check if account was active
                if(oldAcc.Active__c == 'Yes'){
                    //addError
                    oldAcc.addError('Cannot delete active account. Go away.');
                }
            }
        }
        
    }

    if(Trigger.isAfter && Trigger.isInsert){
        //query accounts and then pass the new list
        List<account> accs = [SELECT Id, Name FROM Account WHERE Id IN :trigger.new];
        system.debug('Accounts ' + accs);
        //enqueue queueable
        AccountQueueableDemo aq = new AccountQueueableDemo(accs);//trigger.new is readOnly in after triggers.
        id queueJobId = System.enqueueJob(aq); 
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        //check if vip is changed, and if so, update all its contacts.
        AccountTriggerHandler.updateContactsVIP(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    //this code will execute when record is UNDELETED.
    if(Trigger.isAfter && Trigger.isUndelete){
        system.debug('UNDELETE TRIGGER');
        system.debug('UNDELETE TRIGGER trigger.new: ' + trigger.new);
        system.debug('UNDELETE TRIGGER trigger.old: ' + trigger.old);
        //update account description. 
        AccountTriggerHandler.accUpdateOnUndelete(trigger.new);
    }


    system.debug('---end----');
    
    









    // cmd  + /
    // cntrl + /

    // if(Trigger.isBefore && Trigger.isUpdate){

    //     //print statement if website field is updated
    //     //also print number of account in which website field is updated

    //     //for each loop of trigger.new
    //         //so we have new account
    //         //we get old account --> how?   oldMap.get(id)
    //         //new website variable from new account
    //         //old website variable from old account
    //         //if old website != new website
    //             //print
    //             //count++

    //     integer count=0;
    //     //we cannot do the same for each loop in after insert. Why?
    //     for (Account newAcc : trigger.new) {
    //         string newWebsite = newAcc.Website;
    //         //Account oldAcc = trigger.OldMap.get(newAcc.id);
    //         string oldWebsite = trigger.OldMap.get(newAcc.Id).Website;
    //         //string oldWebsite2 = oldAcc.Website;

    //         if(newWebsite != oldWebsite){
    //             system.debug('for account ' + newAcc.Name + ', updated website is ' + newWebsite);
    //             count++;
    //         }
    //     }
    //     system.debug('# of accounts where website is changed is ' + count);
    // }


    // //`(before insert =1, after insert =2, before update =3, after update= 4)`
    // //print old name and new account name of all updated accounts.
    //     //what action is user doing?
    //         //user is updating account?
    //             //before update, and after update
    
    // //we will do it after update
    // if(Trigger.isAfter && Trigger.isUpdate){

    //     // List<account> accTriggerNew = trigger.new;
    //     // Map<id, account> accTriggerNewMap = Trigger.newMap;
        
    //     set<id> accountIds = trigger.newMap.keySet();
    //     //set<id> accoundIds2 = accTriggerNewMap.keySet();

    //     for (Id accId : accountIds) {
    //         system.debug('-------s-------');
    //         system.debug('account id (key of maps) => ' + accId);
    //         Account newAcc = trigger.newMap.get(accId);//gets new account record value from newMap
    //         // Account newAcc = accTriggerNewMap.get(accId)
    //         Account oldAcc = trigger.oldMap.get(accId);//gets old account record value from oldMap
    //         system.debug('old acc name: ' + oldAcc.Name);
    //         system.debug('new acc name: ' + newAcc.Name);
    //     }

    //     for(Account newAcc: trigger.new){
    //         system.debug('======s======');
    //         id accId = newAcc.Id;
    //         system.debug('account id (key of maps) => ' + accId);
    //         //Account newAcc = trigger.newMap.get(accId);//gets new account record value from newMap
    //         Account oldAcc = trigger.oldMap.get(accId);//gets old account record value from oldMap
    //         system.debug('old acc name: ' + oldAcc.Name);
    //         system.debug('new acc name: ' + newAcc.Name);
    //     }
    // }


    // if (Trigger.isBefore && Trigger.isInsert) {
    //     system.debug('===BEFORE INSERT====');
    //     system.debug('Trigger.new in before insert: ' + trigger.new);//yes, present (but ID is null)
    //     system.debug('Trigger.old in before insert: ' + trigger.old);//NULL (no old data)
    //     system.debug('Trigger.newMap in before insert: ' + trigger.newMap);//NULL (why? no id, so no key, so no map)
    //     system.debug('Trigger.oldMAP in before insert: ' + trigger.oldMap);//NULL (no old data)
    // }
    // if (Trigger.isAfter && Trigger.isInsert) {
    //     system.debug('===AFTER INSERT====');
    //     system.debug('Trigger.new in after insert: ' + trigger.new);//yes, present (ID is also present)
    //     system.debug('Trigger.old in after insert: ' + trigger.old);//NULL
    //     system.debug('Trigger.newMap in after insert: ' + trigger.newMap);//yes, present
    //     system.debug('Trigger.oldMap in after insert: ' + trigger.oldMap);//NULL
    // }

    // if (Trigger.isBefore && Trigger.isUpdate) {
    //     system.debug('===BEFORE UPDATE====');
    //     system.debug('Trigger.new in before Update: ' + trigger.new);//yes, present
    //     system.debug('Trigger.old in before update: ' + trigger.old);//yes, present 
    //     system.debug('Trigger.newMap in before Update: ' + trigger.newMap);//yes, present
    //     system.debug('Trigger.oldMap in before update: ' + trigger.oldMap);//yes, present 

    // }
    // if (Trigger.isAfter && Trigger.isUpdate) {
    //     system.debug('===AFTER UPDATE====');
    //     system.debug('Trigger.new in after Update: ' + trigger.new);//yes, present
    //     system.debug('Trigger.old in after update: ' + trigger.old);//yes, present 
    //     system.debug('Trigger.newMap in after Update: ' + trigger.newMap);//yes, present
    //     system.debug('Trigger.oldMap in after update: ' + trigger.oldMap);//yes, present 
    // }

    // if(trigger.isAfter){
    //     system.debug('# of account inserted: ' + accTriggerNew.size());
    //     system.debug('account record details: ' + accTriggerNew);

    //     for (Account newAccount : accTriggerNew) {
    //         system.debug('=== new account detail===');
    //         system.debug('new Acc Id and Name: ' + newAccount.Id + ' ' + newAccount.Name);
    //     }
        
    // }

    // //will be true in Before insert and before update
    // if (Trigger.isBefore) {
    //     system.debug('BEFORE TRIGGER');
    //     if (Trigger.isInsert) {
    //         system.debug('Before Insert Trigger');
    //     }
    //     if(Trigger.isUpdate){
    //         system.debug('Before update trigger');
    //     }
    // }

    // if(Trigger.isAfter){
    //     system.debug('AFTER TRIGGER');
    //     if (Trigger.isInsert) {
    //         system.debug('After Insert Trigger');
    //     }
    //     if(Trigger.isUpdate){
    //         system.debug('After update trigger');
    //     }
    // }


    // //CHECK BEFORE INSERT
    // if (Trigger.isBefore && Trigger.isInsert) {
    //     system.debug('before insert trigger called.');
    // }

    // //Check AFTER INSERT
    // if(Trigger.isAfter && Trigger.isInsert){
    //     system.debug('after insert trigger called.');
    // }

    // //Check BEFORE UPDATE
    // if(Trigger.isBefore && Trigger.isUpdate){
    //     system.debug('before update trigger called.');
    // }

    // //Check AFTER UPDATE
    // if(Trigger.isAfter && Trigger.isUpdate){
    //     system.debug('after update trigger called.');
    // }

    // system.debug('trigger is running is INSERT context? ' + trigger.isInsert);
    // system.debug('trigger is running is UPDATE context? ' + trigger.isUpdate);

    // //print insert ONLY while inserting
    // if(Trigger.isInsert){
    //     system.debug('before insert trigger called.');
    // }
    
    // //print update ONLY while updating
    // if(Trigger.isUpdate){
    //     system.debug('before update trigger called.');
    // }
    // system.debug('Trigger is running in before? ' + trigger.isBefore);
    // system.debug('Trigger is running in AFTER? ' + trigger.isAfter);
    // //before insert system debug MUST be printed ONLY in before 
    // if(Trigger.isBefore){
    //     system.debug('account before insert trigger called.');
    // }
    
    // //after insert system debug must be printed ONLY in after
    // if(Trigger.isAfter){
    //     system.debug('account after insert trigger called');
    // }
    

    
}