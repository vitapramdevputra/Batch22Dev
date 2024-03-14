//get all country code records
    //if we want to get records from any other sObject SOQL

//List<countrycode__c> allCC = [select id, name, code3__c from countryCode__c];

Map<String, CountryCode__c> allCC = CountryCode__c.getAll();
system.debug(allCC);
for(CountryCode__c eachCC: allCC.values()){
    system.debug('eachCC Name and Code3: ' + eachCC.Name + ' -- ' + eachCC.code3__c);
}

//we can also directly get only ONE record from countryName
//account -> billing address -> country --> Mexico
string country = 'Mexico';

CountryCode__c c1 = CountryCode__c.getInstance(country);
system.debug(country + ' code3 is: ' + c1.code3__c);