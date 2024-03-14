//MapDemo.map1();

map<string, string> countryCurrMap = new map<string, string>{ 'USA' => 'Dollar', 'Canada' => 'CAD'};
countryCurrMap.put('Japan', 'Yen');
countryCurrMap.put('France', 'Euro');
countryCurrMap.put('Germany', 'Euro');
countryCurrMap.put('India', 'Rupees');
countryCurrMap.put('India', 'Rupee');
countryCurrMap.put('Turkiye', 'Lira');
countryCurrMap.put('El Salvador', 'Bitcoin');

system.debug('country currency map : ' + countryCurrMap);

//.get(key);
//string IndiaCurr = countryCurrMap.get(0);//error -> because map's key is string datatype

string IndiaCurr = countryCurrMap.get('India');
string TurkiyeCurr = countryCurrMap.get('Turkiye');
system.debug('India currency is ' + IndiaCurr);
system.debug('Turkiye currency is ' + TurkiyeCurr);
system.debug('Italy currency is ' + countryCurrMap.get('Italy'));


string key1 = 'Japan';
string value1 = countryCurrMap.get(key1);
system.debug(key1 + ' currency is ' + value1);


if(countryCurrMap.containsKey('Spain')){
    system.debug('Spain currency is ' + countryCurrMap.get('Spain'));
}


//all keys from map. We will get all keys from map using keySet() method
set<string> allCountries = countryCurrMap.keySet();//this will return set<string>. String because key is string datatype. Why set? keys are unique like set
system.debug('all countries ==> ' + allCountries);
//for each loop for maps. We don't have for each loop for maps
//we do for each loop for set, and get each value inside the loop
for(string eachCountry: allCountries){
    system.debug('-----');
    system.debug('country is ' + eachCountry);
    string countryCurrency = countryCurrMap.get(eachCountry);
    system.debug('currency is ' + countryCurrency);
}




Map<integer, string> map2 = new map<integer, string>{ 1 => 'one', 2 => 'two', 3 => 'thirty', 3 => 'three'};
map2.put(4, 'four');

system.debug(map2);

//how to get value from given key
integer key1 = 2;
map2.get(2);

//to get all keys we use keyset method
set<integer> allKeys = map2.keyset();
system.debug(allKeys);

//to get all values we use values()
list<string> allValues = map2.values();
system.debug(allValues);
system.debug('-----');
 for(integer eachKey: map2.keySet()){
    //use get(eachKey) method to get each value
    system.debug(eachKey + ' key value is ' + map2.get(eachKey));
}