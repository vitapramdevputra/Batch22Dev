public class DmlDemo2 {


    public static void dml6Wrong() {
        //we want to insert contact record
            //we want to relate it with one account

        Contact c1 = new contact();
        c1.FirstName = 'San';
        c1.lastName = 'Bernandino';
        c1.accountid = '001Ho00001I5T5GIAV';//hard coded id. this is WRONG. 
        insert c1;

        
    }

    public static void dml7() {
        //how can we get account id of softinnovas account
        Account acc = [select id, name from account where name = 'softinnovas' limit 1];

        //create related contact record
        Contact c2 = new Contact();
        c2.FirstName = 'Joe';
        c2.LastName = 'Biden';
        c2.accountid = acc.id; //set account id relationship
        insert c2;
        
    }
    public static void dml8() {
        //first way
        // Salesforce_Project__c oldWaySP = new Salesforce_Project__c();
        // oldWaySP.Project_Name__c = 'To Something';
        // oldWaySP.Status__c = 'New';
        // insert oldWaySP;

        //second way
        Salesforce_Project__c sp = new Salesforce_Project__c(
            Project_Name__c = 'Learn SOQL',
            Status__c = 'Completed'
        );
        insert sp;
    }

    //create salesforce project record and create salesforce ticket too.
        //Learn Salesforce (Project) - In Progress
            //learn relationships (ticket) - Completed, Priority = high
    public static void dml9() {
        //first create Project
         Salesforce_Project__c sp = new Salesforce_Project__c(
            Project_Name__c = 'Learn Salesforce',
            Status__c = 'In Progress'
        );
        insert sp;
        //can we get sp id here?
        system.debug('salesforce project id ==> ' + sp.Id);

        //can we direct create related ticket? Or we will need to query salesforce project?
        //we have sp.id, so NO need to query.

        Salesforce_Ticket__c st = new Salesforce_Ticket__c(
            Subject__c = 'Learn Relationships',
            Status__c = 'Completed',
            Priority__c = 'High'
        );
        st.Salesforce_Project__c = sp.id; //establish relationship with newly created project.
        insert st;
    }

    //Department and Employee
        //Department is parent
        //Employee is child
    
    //1. create Department - name__c => AI
    //2. create Employee for AI department
        //
    public static void dml10() {
        Department__c d = [select id, name__c from Department__c limit 1];
        system.debug('d.id or name ===> ' + d.Id + ' ' + d.Name__c);

        Department__c d1 = new Department__c();
        d1.Name__c = 'Artificial Intelligence';
        insert d1;

        Employee__c e1 = new Employee__c();
        e1.Department__c = d1.Id;//establish relationship
        e1.First_Name__c = 'Jarvis';
        e1.Last_Name__c = 'Stark';
        insert e1;

    }

    public static void dml11Wrong() {
        for (Integer i = 0; i < 160; i++) {
            Account a = new account(
                name = 'wrong account ' + i
            );
            insert a; //don't try this at home. //PB will execute 160 times
        }
    }
    //DML rows => number of records => 10k in one apex execution
    //# of DMLs => number of insert/update statements => 150 in one apex execution


    public static void dml12() {
        List<account> accList = new list<account>();

        for (Integer i = 0; i < 160; i++) {
            Account a = new account(
                name = 'Softinnovas v' + i
            );
            //insert a;  //don't try this at home. (Wrong Way)
            accList.add(a);
        }

        //insert list
        insert accList; //1 DML, how many DML ROWS? 160. PB will execute ONLY 1
    }

}