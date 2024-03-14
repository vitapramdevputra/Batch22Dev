trigger ContactTrigger on Contact (before insert, before update, after insert, after update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        //freeze contact if Lead Source is already Partner Referral.
        ContactTriggerHandler.validation1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        //throw error if lead source ic changed
        ContactTriggerHandler.validation2(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

}