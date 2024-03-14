//variable

//datatype      variablename  =(assignment)     value
String  first = 'this is a first variable';
system.debug('first variable ===> ' + first);


string firstName = 'Vitap';
string lastName = 'Ramdevputra';

string fullname = firstName + ' ' + lastName;
System.debug(fullname);

string declare;
system.debug(declare);

string define = 'some string';
system.debug(define);

string x;
system.debug(x);//null
x = 'Something';
system.debug(x);//Something

string a,b,c;//declaring 3 variables
a = 'a or A';
b = 'b or B';
c = 'c or C';


//long way
string x= 'Apex';
string y = 'is ';
string z = 'fun';
system.debug(x+y+z);

//short way
string x1= 'Apex', y1 = 'is ', z1 = 'fun';//defining 3 variables
system.debug(x1+y1+z1);


//str = 'we can\'t use it here'; //we cannot use it before declaration.

string str = 'some string';
//string str = 'once again';//we cannot redifine in same code block. ERROR
system.debug(str);
str = 'updated string';//we can reassign value

//string h = 15;//is this valid? NO.



