public class StringDemo2 {
    public void method3(){
        string str = 'My name is Bond. James Bond.';
        integer indexOfBond = str.indexOf('Bond');
        system.debug('index of Bond is ' + indexOfBond);
        integer indexOfBond2 = str.indexOf('JamesBond.');
        system.debug('index of JamesBond is: ' + indexOfBond2);

        integer indexOfBond3 = str.indexOf('bond.');
        system.debug('index of bond is: ' + indexOfBond3);
    }
    
    public void method4(){
        string s1 = 'Welcome to Softinnovas Salesforce Bootcamp. Ready to learn? Ready to have fun?';
        string s2 = s1.remove('Ready');
        system.debug(s2);

        string s3 = s1.removeEnd('?');
        system.debug('remove end example: ==>> ' + s3);

    }
    
}