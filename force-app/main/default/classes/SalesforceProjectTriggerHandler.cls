public  class SalesforceProjectTriggerHandler {
    public static void createDefaultTicket(List<Salesforce_Project__c> spTriggerNew) {
        try {
            List<Salesforce_Ticket__c> createTickets = new List<Salesforce_Ticket__c>();

            //custom setting
            DefaultTicketInfo__c defaultValues = DefaultTicketInfo__c.getOrgDefaults();

            for (Salesforce_Project__c newSP : spTriggerNew) {
                Salesforce_Ticket__c st = new Salesforce_Ticket__c();
                st.Subject__c = defaultValues.Subject__c;
                st.Status__c = defaultValues.status__c;
                st.Salesforce_Project__c = newSP.Id;
                st.Priority__c = defaultValues.priority__c;
                st.Description__c = defaultValues.description__c;
                createTickets.add(st);
            }
            insert createTickets;
        } catch(Exception e) {
            System.debug(e.getMessage());
            //log error from here. Create record in errorLog object.

            //throw custom error.
            for(Salesforce_Project__c newSP : spTriggerNew) {
                string errorMsg = system.label.SF_Project_Error;
                newSP.addError(errorMsg);
            }
        }
    }

    public static void validateProjectCompletion(List<Salesforce_Project__c> spTriggerNew, List<Salesforce_Project__c> spTriggerOld, Map<id, Salesforce_Project__c> spTriggerNewMap, Map<id, Salesforce_Project__c> spTriggerOldMap) {

        //for each loop on triggerNew
            //check if status is changed and marked as Completed
                //yes -> get tickets for that project (SOQL) which is NOT completed
                    //if we find any ticket then we throw error
                //no --> we good.
        
        set<id> spids = new set<id>();
        //for each loop on triggerNew
        for (Salesforce_Project__c newSP : spTriggerNew) {
            //check if status is changed and marked as completed
            if(newSP.Status__c == 'Completed' && newSP.Status__c != spTriggerOldMap.get(newSP.Id).Status__c){
                //collect all project ids.
                spids.add(newSP.Id);
            }  
        }

        if(!spids.isEmpty()){
            //get not-completed tickets of projects 
            List<Salesforce_Ticket__c> openTickets = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c 
                                                        where salesforce_project__c in :spids and Status__c != 'Completed'];
            for (Salesforce_Ticket__c eachTicket : openTickets) {
                //throw error on project
                Salesforce_Project__c newSP = spTriggerNewMap.get(eachTicket.Salesforce_Project__c);
                newSP.addError('Cannot complete project because all its tickets are NOT completed.');
            }
        }
    }

    @future //passing set<id> since list<salesforce_project__c> is NOT supported. (NO SOBJECT)
    public static void updateDescriptionFuture(set<id> spIds) {
        //update description of all the projects which are created. 
            //append 'updated from future' in description field.
        system.debug('project ids: ' + spIds);
        
        List<Salesforce_Project__c> allProjects = [select id, description__c from Salesforce_Project__c where id in :spIds];

        for(Salesforce_Project__c eachSP : allProjects){
            eachSP.Description__c += ' Updated from future';
        }
        update allProjects;
    }

    //Method A
    //check and prepare set<id> of sp ids for which status is updated to 'completed'

    public static void spCompletedStatus(List<Salesforce_Project__c> spTriggerNew, List<Salesforce_Project__c> spTriggerOld, Map<id, Salesforce_Project__c> spTriggerNewMap, Map<id, Salesforce_Project__c> spTriggerOldMap){
        set<id> spids = new set<id>();
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            if(eachSP.Status__c != spTriggerOldMap.get(eachSP.id).Status__c && eachSP.Status__c == 'Completed'){
                spids.add(eachSP.Id);
            }
        }

        if(!spids.isEmpty()){
            //call future method
            updateTicketStatusCompleted(spids);
        }

    }

    @future
    public static void updateTicketStatusCompleted(set<id> spids){
        //get all tickets which are NOT completed.
            //update status to completed

        List<Salesforce_Ticket__c> allST = [select id, status__c from Salesforce_Ticket__c where Salesforce_Project__c in :spids and status__c != 'Completed'];

        for(Salesforce_Ticket__c eachST : allST){
            eachST.status__c = 'Completed';
        }
        update allST;
    }

}