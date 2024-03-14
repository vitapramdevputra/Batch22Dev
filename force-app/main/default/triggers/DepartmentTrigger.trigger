trigger DepartmentTrigger on Department__c (before insert, before update) {
    
    if(Trigger.isBefore){

        //validate that department name is atleast 3 characters. If it is less than 3 then throw error and say 'Department name not valid. Be serious.'
        DepartmentTriggerHandler.validateName(trigger.new);

        //if short code is blank then update it with first 3 characters of name and in capital
        //call handler method to update short code if blank
        DepartmentTriggerHandler.updateShortCode(trigger.new);
    }
}