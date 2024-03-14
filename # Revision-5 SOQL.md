# Revision-5 SOQL

- prepared data using dataimport.io
- SOQL
    - Basic syntax to fetch or get or retrieve data from sObject (standard + custom object)
    - `select id, name, phone from account`
    - `select id, name, email phone  from contact` - ERROR only aggregate expressions use field aliasing
    - `select name, phone from account` - ID is NOT mandatory
    - In Dev Console > File > Open > object > open any object > select fields and click 'Query'
    - `SELECT Name, Id, Country__c, Department__c, Email__c, First_Name__c, JoinDate__c, Last_Name__c, Phone_No__c, Salary__c FROM Employee__c`
    - Filter and operators in SOQL
        - `where`
            - `select id, name, phone,industry from account where industry = 'Entertainment' or industry = 'Agriculture' or active__c = 'Yes'`
            - if we want to use `and`, and `or` together in one query, then we MUST use brackets
                - `select id, name, phone,industry, website from account where (industry = 'Entertainment' or industry = 'Agriculture' or active__c = 'Yes') and website != ''`
        - `LIKE`
            - like is used for wildcard 
                - `select name, email, phone from contact where email LIKE '%@gmail.com` //starts with
                - `select name, email, phone from contact where email LIKE '%fun%'` //contains
                - `select name, email, phone from contact where name LIKE '__a'`
        - `IN`
            - `select id, name, phone,industry from account where industry IN ('Entertainment', 'Agriculture', 'Engineering')  or active__c = 'Yes'`
        - `NOT IN`
            - `select id, name, phone,industry from account where industry NOT IN ('Entertainment', 'Agriculture', 'Engineering')  or active__c = 'Yes'`
        - `Date literals`
            - `YESTERDAY`, `TODAY`, `TOMORROW`, `LAST_N_WEEK:1`, `NEXT_90_DAYS`, `LAST_90_DAYS`, `NEXT_MONTH`, `LAST_MONTH`
            - `SELECT Name, Id, Country__c, Department__c, Email__c, First_Name__c, JoinDate__c, Last_Name__c, Phone_No__c, Salary__c FROM Employee__c where createddate = LAST_WEEK`
        - `Order by`, `LIMIT`
            - `SELECT Name, Id, Country__c, Department__c, Email__c, First_Name__c, JoinDate__c, Last_Name__c, Phone_No__c, Salary__c FROM Employee__c ORDER BY JoinDate__c` by default ascending
            - `SELECT Name, Id, Country__c, Department__c, Email__c, First_Name__c, JoinDate__c, Last_Name__c, Phone_No__c, Salary__c FROM Employee__c ORDER BY JoinDate__c DESC` for descending write  DESC 
            - use LIMIT to return limited number of records
                - `select id, name account limit 5`
                - `select id, name account order by createddate desc limit 1` //rectly created 1 account
- SOQL in APEX
    - how does SOQL Query return?
        - `list<sObject>`: whichever sObject we are querying
        - `List<contact> listContact = ['Select id, name, email from contact']`; 
        - `Contact con = [select id, name, email from contact where email = 'sean@edge.com' limit 1]`; //we can store in just sObject(without list), if our query returns EXACTLY ONE record.
    - how to get individual field values from SOQL?
        ~~~
        Account acc = [select id, name, phone, active__c, accountnumber from account limit 1];
        system.debug('acc name : ' + acc.name);
        system.debug('acc phone : ' + acc.phone);
        system.debug('acc active : ' + acc.active__c);
        system.debug('acc account number : ' + acc.accountnumber);//will this work? NO. It will not work until we select in SOQL.


        List<Account> listAcc = [select id, name, phone,active__c, accountnumber from account];
        for(account eachAcc: listAcc){

            if(eachAcc.active__c == 'yes'){
                system.debug('eachAcc name : ' + eachAcc.name);
                system.debug('eachAcc phone : ' + eachAcc.phone);
                system.debug('eachAcc Account number : ' + eachAcc.accountnumber);
            }
        }

        ~~~
- Relationship SOQL
    - CHILD TO Parent
        - we are retrieving CHILD Records using SOQL, and we want to get parents information, just use `parentAPiName.FieldAPIName`
            - `select id, CaseNumber, subject, priority, status, accountid, account.name, account.active__c, account.industry from case`
            ~~~
            list<case> lstCase = [select id, CaseNumber, subject, priority, status, accountid, account.name, account.active__c, account.industry from case];
            for(case eachCase: lstCase){
                //if account is active == yes
                if(eachCase.account.active__c == 'Yes'){
                    system.debug('case number: ' + eachCase.casenumber);
                    system.debug('subject : ' + eachCase.subject);
                    system.debug('acc industry: ' + eachCase.account.industry);
                }
            }
            ~~~
    - PARENT  TO CHILD
        - we are retrieving Parent information using SOQL, and we want to get all its childs information too.
        - get account information, and all its case information
            - `select id, name, (select subject, casenumber from cases), annualrevenue, industry from account where name like '%oil%'`
            - `select id, name, name__c,(select first_name__c, last_name__c from employees__r) from department__c`
            - get all info in apex
                ~~~
                List<department__c> listDep = [select id, name, name__c,(select first_name__c, last_name__c, salary__c from employees__r) from department__c];
                for(department__c eachDep: listDep){
                    system.debug('dep name : ' + eachDep.name__c);
                    for(employee__c eachEmp: eachDep.employees__r){
                        system.debug('emp name: ' + eachEmp.first_name__c + ' ' + eachEmp.last_name__c );
                        system.debug('emp salary: ' + eachEmp.salary__c);
                    }
                }
                ~~~
- Aggregate Queries
    - `Count(), SUM(), MIN(), MAX(), AVG() functions in SOQL`
        `select country__c, count(id), Max(salary__c), Avg(salary__c), MIN(Salary__c) from employee__c group by country__c`
    - GROUP BY
        - group records by one or more fields and get aggregate results
            - `select type, count(id), sum(annualrevenue) from account group by type`
        - be careful: 
            - you MUST aggregate all fields apart from field which is used in group by.
                - `select type, name, count(id) from account group by type, name` 
                - `select industry, type, count(id) from account group by type, industry`
    - HAVING CLAUSE
        - where condition for group fields.
            - `select type, count(id), sum(annualrevenue) from account GROUP BY type HAVING count(id) > 2 and SUM(annualrevenue)> 100000`

- Aggregate queries in APEX
    - how do we fetch results of aggregate query in apex?
        - `List<AggregateResult> results = [select type, count(id), sum(annualrevenue) from account GROUP BY type HAVING count(id) > 2 and SUM(annualrevenue)> 100000]`;
            - how to get details of individual fields?
                ~~~
                for(AggregateResult ar: results){
                    system.debug('type ==> ' + ar.get('type'));
                    system.deub('count ==> ' + ar.get('expr0'));
                    system.deub('sum of revenue ==> ' + ar.get('expr1'));
                }
                ~~~
        
            