public with sharing class FutureMethodDemo {
   
    public static void nonFutureMethod() {
        system.debug('non-future method called.');
    }

    //rules for future method:
    //1. method should be static
    //2. method must return void
    //3. @future method annotation
    //4. parameters can be primitive datatype, or collection of primitive datatype - set<id>, list<string>, list<id>, 
        //cannot pass object or sObject (account, contact etc), not even list<account>, list<contact>, map<id, account> etc

    @future
    public static void futureMethod() {
        system.debug('future method called.');
    }
}