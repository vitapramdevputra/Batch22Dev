SoqlDemo2.parentToChildSOQL3();
SoqlDemo2.parentToChildSOQL2();
SoqlDemo2.parentToChildSOQL1();


List<Employee__c> listEmp = [select id, first_name__c, country__c from Employee__c];
for(Employee__c eachEmp: listEmp){
    system.debug('emp name and country : ' + eachEmp.first_name__c + ' ' eachEmp.country__c);
}



Map<string, string> map0 = new Map<string, string> {'country' => 'AUS', 'expr0'=>'15'};
system.debug(map0);//{country=AUS, expr0=15}
map0.get('country');
map0.get('expr0');

//aggregate functions will give us statistics
List<AggregateResult> empAgg = [select country__c, count(id), sum(salary__c) from employee__c group by country__c];
for(AggregateResult eachResult: empAgg){
    system.debug('=====s======');
    system.debug('full aggreagate result: ' + eachResult); //AggregateResult:{Country__c=AUS, expr0=8, expr1=6750000.0}

    system.debug('employee country: ' + eachResult.get('country__c'));
    system.debug('employee count ' + eachResult.get('expr0'));
    system.debug('employee sum of salary ' + eachResult.get('expr1'));

}


List<AggregateResult> duplicateAccounts = [select name, count(id) from account group by name having count(id) > 1];
system.debug(duplicateAccounts);
for(AggregateResult eachAcc: duplicateAccounts){
    system.debug(eachAcc.get('name'));
    system.debug(eachAcc.get('expr0')); //to get aggregate field result we use expr0
}




