integer i = 5;

//integer x = i + 10;
i = i + 10;
i += 10;
system.debug(i);


boolean c1 = ((i >= 25) && (i < 50));
system.debug(c1); //true

integer j = i - 18;

boolean c2 = !(c1 && (j > 10));// !(true && )
system.debug(c2);


string s1 = 'this';
string s2 = 'THIS';

boolean c3 =  (s1 == s2); //equality operator with string is case insensitive
system.debug('c3 => ' + c3);

boolean c4 = s1.equals(s2);
system.debug('c4 => ' + c4);

boolean c5 = !String.isEmpty(s2); //this will be true is string is NOT empty

string s3 = ''; //empty and blank => true
string s4;//empty and blank => true
string s5 = ' ';//blank => true, empty => false

system.debug('s3 isEmpty => ' + string.isEmpty(s3));
system.debug('s4 isEmpty => ' + string.isEmpty(s4));
system.debug('s5 isEmpty => ' + string.isEmpty(s5));

system.debug('s3 isBlank => ' + string.isBlank(s3));
system.debug('s4 (null) isBlank => ' + string.isBlank(s4));
system.debug('s5 (space) isBlank => ' + string.isBlank(s5));



