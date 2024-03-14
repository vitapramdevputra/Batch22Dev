trigger EmployeeTrigger on Employee__c (before insert, before update, after insert, after update, after delete, after undelete) {
    if(Trigger.isBefore){
        //call method
        EmployeeTriggerHandler.validateJoinDate(trigger.new);
    }
    if(Trigger.isAfter){
        //call method to count # of employees
        EmployeeTriggerHandler.countEmployees(trigger.New, trigger.Old, trigger.NewMap, trigger.OldMap);
    }
}