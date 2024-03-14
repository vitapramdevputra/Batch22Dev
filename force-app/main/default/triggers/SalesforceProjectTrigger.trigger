trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, before update, after insert, after update) {
    if(Trigger.isAfter && Trigger.isInsert){
        //call method to create new default ticket.
        SalesforceProjectTriggerHandler.createDefaultTicket(trigger.new);
        SalesforceProjectTriggerHandler.updateDescriptionFuture(Trigger.newMap.keySet());
        //assume we update salesforce_project__c record which we passed in future method.
        system.debug('DONE');
    }
    
    // if(Trigger.isBefore && Trigger.isUpdate){
    //     //SalesforceProjectTriggerHandler.validateProjectCompletion(trigger.New, trigger.Old, trigger.NewMap, trigger.OldMap);
    // }

    if(Trigger.isAfter && Trigger.isUpdate){
        //call handler method to mark all tickets status of that project  to completed
        SalesforceProjectTriggerHandler.spCompletedStatus(Trigger.new, Trigger.Old, Trigger.newMap, Trigger.oldMap);
    }
}