public class StringDemo {
    public void method1(){
        string d = 'learning string methods in apex language.';
        
        //req1: length of above string.
        integer len = d.length();
        system.debug('length of string d is ' + len);

        //req2: convert string to upper case
        string dCaps = d.toUpperCase();
        system.debug('uppercase string : ' + dCaps);
        system.debug('original string: ' + d);//it will be same or converted to uppercase?

        //req3: check if string contains apex
        boolean check1 = d.contains('apex');//if apex is present in d string.
        system.debug('contains apex? ' + check1);

        boolean check2 = d.contains('Apex');
        system.debug('contains Apex? ' + check2); //false

        boolean check3 = d.contains('ing methods');
        system.debug('contains `ing methods`? ' + check3);

        boolean check4 = d.contains('salesforce');
        system.debug('contains salesforce? ' + check4);

        //req3.2: contains ignore case 
        boolean check22 = d.containsIgnoreCase('APex');//it will check if string contains apex ignoring case
        system.debug('check22, contains APex? ' + check22);

        string s = 'APEX';
        boolean check33 = d.contains(s);
    }

    public void method2(){
        string username = ' batch22 dev   ';
        system.debug('length of username: ' + username.length());

        string username2 = username.trim();//remove white space from before and after the text
        system.debug('length of username2: ' + username2.length());
        system.debug('username2: ' + username2);

        string s1 = 'soup';
        string s2 = 'soup';
        string s3 = 'Soup';

        //s1 is equal to s2
        boolean equal1 = s1.equals(s2);//
        system.debug('equal1 ==> ' + equal1);

        boolean equal2 = s1.equals(s3);
        system.debug('equal2 ==> ' + equal2);

        
        string s4 = 'No soup for you';
        boolean chq1 = s4.contains('soup');//true. Check sequence of characters is present in the string
        boolean chq2 = s4.equals('soup');//false. Check if string is exactly same.
        boolean chq3 = s4.equals('No soup for you');//true

    }
}