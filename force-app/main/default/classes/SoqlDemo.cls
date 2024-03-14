public class SoqlDemo {
    public static void accountSOQL1() {
        //SOQL always returns list<sObject>
        list<account> accList = [select id, name, type from account limit 5];
        system.debug('acc list: ' + accList);
    }

    public static void accountSOQL2() {
        //list will always work.
        //but if SOQL is returning JUST 1 record we can store it in single sobject also
        //list<account> accList = [select name, phone from account ORDER BY CreatedDate DESC limit 1];
        Account acc = [select name, phone,Industry from account ORDER BY CreatedDate DESC limit 1]; //this MUST exactly return 1 record. 
        
        system.debug('account full record: ' + acc);

        system.debug('account name: ' + acc.Name);
        system.debug('account phone: ' + acc.Phone);
        system.debug('account industry: ' + acc.Industry);//we MUST select in query if we want to use it. Else we will get error : System.SObjectException: SObject row was retrieved via SOQL without querying the requested field: Account.Industry
    }
    public static void accountSOQL3() {
        list<account> top10Acc = [select name, phone, industry from account order by createddate desc limit 10];

        //to get fields for each individual record, we MUST process it one by one.
        for (account eachAcc : top10Acc) {
            system.debug('----s-----');
            string accName = eachAcc.Name;
            system.debug('acc name ==> ' + accName);
            system.debug('acc phone ==> ' + eachAcc.Phone);
            system.debug('acc industry ==> ' + eachAcc.Industry);
        }
    }

    public static void accountSQOL4() {
        list<account> filteredAcc = [select id, name, phone, website, industry from account where Industry = 'Energy'];
        system.debug('energy accounts: ' + filteredAcc);
    }

    public static void accountSQOL4(string industry) {
        //to use apex variables in soql filter use :
        list<account> filteredAcc = [select id, name, phone, website, industry from account where Industry = :industry];
        // =: industry //a little wrong
        // = :industry //perfect
        system.debug( industry +  ' accounts: ' + filteredAcc);
    }

    public static void childToParentSOQL1() {
        //contact records
        list<contact> contacts = [select id, name, email, phone, MailingAddress, account.name, account.industry from contact limit 10];

        for (Contact eachContact : contacts) {
            system.debug('--------');
            system.debug('contact detail: ' + eachContact.Name + ', email: ' + eachContact.Email);
            system.debug('this contact belongs to account: ' + eachContact.account.Name + ' -- ' + eachContact.account.Industry);
        }

    }



}