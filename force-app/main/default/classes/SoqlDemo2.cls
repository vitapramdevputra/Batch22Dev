public class SoqlDemo2 {
    public static void parentToChildSOQL1(){
        List<Account> lstAccount = [select id, name, (select subject, casenumber from cases), annualrevenue, industry from account where name like '%oil%'];
        //print account info
            //print all its case info too
        for(account eachAcc: lstAccount){
            system.debug('-----s-----');
            system.debug('eachAcc name: ' + eachAcc.Name);
            system.debug('eachAcc industry: ' + eachAcc.industry);
            system.debug('eachAcc annualrevenue: ' + eachAcc.annualrevenue);

            list<case> accCases = eachAcc.Cases;
            system.debug('# of cases in this account: ' + accCases.size());
            for(case eachAccCase: accCases){
                system.debug('--- case number and subject: ' + eachAccCase.CaseNumber + ', ' + eachAccCase.Subject);
            }
        }
    }

    public static void parentToChildSOQL2(){
        list<account> listAccount = [select id, name, annualrevenue, (select name, amount, stagename from opportunities where stagename = 'Closed won' ) from account where annualrevenue > 1000000];

        for(account eachAcc: listAccount){
            system.debug('=====Acc=====');
            system.debug('acc name and revenue: ' + eachAcc.Name + ', ' + eachAcc.AnnualRevenue);

            List<Opportunity> accOpps = eachAcc.Opportunities;
            //inner loop helps us getting every single opportunity for every single account
            for(Opportunity opp: accOpps){
                system.debug('---> opp name and amount: ' + opp.Name + ', ' + opp.Amount);
            }
        }
    }

    public static void parentToChildSOQL3(){
        list<salesforce_project__c> listSP = [select name, project_name__c, status__c, (select name, subject__c, status__c, priority__c from Salesforce_Tickets__r ) from salesforce_project__c];

        integer totalTickets = 0;
        integer highTickets = 0;

        for(Salesforce_Project__c eachSP: listSP){
            system.debug('====SP====');
            system.debug('project name: ' + eachSP.Project_Name__c);
            system.debug('project status: ' + eachSP.Status__c);

            totalTickets += eachSP.Salesforce_Tickets__r.size();//all tickets of all projects

            for(Salesforce_Ticket__c eachST: eachSP.Salesforce_Tickets__r){
                system.debug('--> st name and subject ' + eachST.Name + ', ' + eachST.Subject__c);
                if(eachST.Priority__c == 'High'){
                    highTickets++; //all high priority tickets in all projects
                }
            }
        }
        system.debug('total tickets are: ' + totalTickets);
        system.debug('high priority tickets are: ' + highTickets);
        
    }
}