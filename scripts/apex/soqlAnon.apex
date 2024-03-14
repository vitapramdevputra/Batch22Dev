SoqlDemo.childToParentSOQL1();
//SoqlDemo.accountSOQL3();
SoqlDemo.accountSQOL4();
SoqlDemo.accountSQOL4('Entertainment');


//CHILD TO PARENT QUERY
    //we are querying CHILD record
    //select id, name, phone, email, aaccountid from contact limit 5

    //to get parent's record information in CHILD SOQL, use dot opration
    //select id, name, phone, email, account.name, account.industry from contact


    //for custom relationships use __r --> salesforce_project__r (relationship field). field name
    //SELECT Id, Name, Salesforce_project__c, salesforce_project__r.project_name__c, Priority__c, Subject__c, Status__c FROM Salesforce_Ticket__c


    //query employee details, get department id, department name along with it

//PARENT TO CHILD SOQL
    //we are querying parent (account), we want to get child's information (contact)
        //1 account will have multiple contacts
        //1 parent many children
        //while querying account we want to get all contacts of all accounts