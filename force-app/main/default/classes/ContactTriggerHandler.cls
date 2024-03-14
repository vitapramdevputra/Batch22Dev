public class ContactTriggerHandler {
   
    public static void validation1(List<contact> conTriggerNew, List<contact> conTriggerOld, Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
        for (Contact newContact : conTriggerNew) {
            
            //if contact's lead source was already partner referral. (NOT NEW, the OLD Record Lead Source  = Partner referral)
            if(conTriggerOldMap.get(newContact.Id).LeadSource == 'Partner Referral'){
                //we can addError ONLY in new (while insert/update)
                newContact.addError('Cannot update Partner Referral Contact');
            }
        }

        // for (Contact oldContact : conTriggerOld) {
        //     if(oldContact.LeadSource == 'Partner Referral'){
        //         conTriggerNewMap.get(oldContact.Id).addError('Cannot update Partner Referral Contact');
        //     }
        // }

    }

    public static void validation2(List<contact> conTriggerNew, List<contact> conTriggerOld, Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
        //add error when lead source field is changed
        for (Contact newContact : conTriggerNew) {
            //check if lead source is changed. HOW?
            if (newContact.LeadSource != conTriggerOldMap.get(newContact.Id).LeadSource) {
                newContact.LeadSource.addError('Can\'t allow you to change lead source. Sorry. ');
            }
        }
    }
}