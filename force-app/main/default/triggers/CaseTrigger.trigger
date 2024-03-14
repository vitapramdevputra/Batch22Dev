trigger CaseTrigger on Case (before insert) {
    system.debug('case before insert trigger');
    system.debug('# of records processed: ' + trigger.size);//trigger.size is context variable - trigger.isBefore, trigger.isAfter, trigger.new, trigger.old

    CaseTriggerHandler.triggerCount++; //1++ => 2
    CaseTriggerHandler.recordCount += trigger.size; //200+50 => 250

    system.debug('# of times trigger executed: ' + CaseTriggerHandler.triggerCount);
    system.debug('# of total records processes: ' + CaseTriggerHandler.recordCount);

    system.debug('================');
}