List<Salesforce_Project__c> spList = new List<Salesforce_Project__c>();

for (Integer i = 0; i < 10; i++) {
    Salesforce_Project__c sp = new Salesforce_Project__c();
    //set all fields
    sp.Project_Name__c = 'Trigger DML v'+i;
    sp.Status__c = 'New';
    sp.Description__c = 'DML is very very easy';
    system.debug('before insert statement: ' + sp);
    spList.add(sp);
}
insert spList;



//insert