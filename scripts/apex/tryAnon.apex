list<account> newAcc = new list<account>();
try {

    string s;
    string s1 = s.toUpperCase();//null pointer exception

    account a = new account();
    newAcc.add(a);
    insert newAcc; //error. code stops here, and throws error. everything will be rolled back.
} catch(DmlException de) {
    system.debug('dml went wrong buddy.');
    system.debug('error message: ' + de.getMessage());
    //to log error -> we can insert record in error log object
} catch(exception ex){
    system.debug('something went wrong buddy.');
    system.debug('ex message: ' + ex.getMessage());
    //to log error -> we can insert record in error log object
}
finally{
    newAcc.clear();
}



system.debug('apex is simple');