List<case> createCases = new list<case>();
for (Integer i = 0; i < 5000; i++) {
    case c = new case();
    c.Subject = 'there is a bug v' + i;
    c.Status = 'New';
    c.Description = 'resolve it now.';
    c.Origin = 'Web';
    createCases.add(c);
}
insert createCases; //this will fire trigger -> trigger will fire 2 times (200 + 50)
//maximum is 10k. Number of DML rows for one transaction.


List<account> acc = new list<account>();
for (Integer i = 0; i < 6000; i++) {
    Account  a = new account( name = 'test');
    acc.add(a);
}
insert acc; //in after trigger ddo we have any DML?




string s = 'this is a string';
system.debug(s);


string s2 = 'In a SOQL query with parent-child relationship subqueries, each parent-child relationship counts as an extra query. These types of queries have a limit of three times the number for top-level queries. The limit for subqueries corresponds to the value that Limits.getLimitAggregateQueries() returns. The row counts from these relationship queries contribute to the row counts of the overall code execution. This limit doesn’t apply to custom metadata types. In a single Apex transaction, custom metadata records can have unlimited SOQL queries. In addition to static SOQL statements, calls to the following methods count against the number of SOQL statements issued in a request.';
system.debug(s);


integer i = 0;

while(i < 5){
    system.debug(i);
}

List<account> listAcc = [select id from account where type = 'Customer']; //10k //maximum 50000. ( Number of query rows:)

for(account eachAcc: listAcc){

}


for(account eachAcc: [select id from account where type = 'Customer'] ){
    if(eachAcc.type = 'Customer'){
        
    }
}



delete [select id from case where createddate = THIS_WEEK];