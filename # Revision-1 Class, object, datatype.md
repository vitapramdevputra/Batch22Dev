# Revision-1 Class, object, datatype

- Class
    - What is a class?
        - it is container of methods (or code) which we reuse again and again.
        - it is a template of something. It has characteristics(variables) or features (methods).
    - Methods
        - method or function is some action
        - for now we write all code inside methods (not directly)
    - sample code to create a class and method?
        ~~~
        public class ClassName{
            public void methodName(){
                system.debug('this is a method');
            }
        }
        ~~~
- Object
    - What is object? how to create object of the class?
        - instance of the class. (similar to creating a new record of the custom object)
    - sample code to create object of above class and call method?
        ~~~
        ClassName obj = new ClassName();
        obj.methodName();
        ~~~

- Datatype
    - Primitive and non-primitive datatypes (collections, sObject)
    - How many Primitive datatypes we studied?
        - 11 or 12
    - which are they?
        - Boolean, string, date, datetime, time, id, integer, decimal, long, double, blob, object
    - Salesforce field datatype and apex datatypes
        - Phone number is which data type? String
        - Currency will be Decimal
        - Name (first name, last name) will be Text
        - URL will also be string
        - Picklist? String
        - Lookup/Masterdetail will be ID (or string)
            - in contact we have account lookup. So, contact's accountid field will be ID.
        - Date/datetime will be date/datetime in apex
- Variables
    - will this below code work?
    ~~~
    string m = 'this is variable m';
    integer m = 99;
    system.debug(m);
    ~~~
    - above code will NOT work. Duplicate fields error because same variable name

    ~~~
    system.debug(m); //will throw error, variable is NOT declared or defined yet.
    string m = 'this is variable m';
    ~~~
    
    ~~~
    integer i = 11.11; //ERROR
    integer j = 10/3; //3
    decimal j2 = 10.3/3; //3.3333333333333333
    ~~~

- Built in methods of string class.
    - Some of the string methods are...
        - `trim()`, `toUpperCase()`, `toLowerCase()`, `equals(string)`, `contains(substring)`, `length()`
        - `containsIgnoreCase(substring) - it will compare the sequence of characters by ignoring case`
        - `indexOf(substring)`
        - `removeEnd(substring)`
        - `String.valueOf(anyOther datatype)` - convert other datatype to string
    - Decimal methods
        - `setScale(2);`
        - `toPlainString() ` -  to convert decimal to string
        - `Decimal.valueOf(string)` - to convert string to decimal
- Date, time, and datetime
    - how can create new `Date` instance?
        - `newInstance`
        - `Date d = Date.newInstance(2022, 15, 10);`
        - `Date d1 = Date.newInstance(2022, 10, 50);`
        - Today's date?
            - `Date d2 = Date.today();`
    - Time
        - `Time t = Time.newInstance(10, 100, 35, 500);`
    - Datetime
        - `Datetime dt1 = Datetime.newInstance(date, time);` //pass date, time
        - `Datetime dt2 = Datetime.newInstance(2023,4,18);` //what will be the time part?
            - time will be User's midnight.
            - it will print in GMT
        - `Datetime dt3 = Datetime.newInstance(year, month, day, hour, minute, seconds);`
        - Current time: `Datetime dt10 = Datetime.now();`
        - `Datetime dt4 = Datetime.newInstance(long);` -- we pas long milliseconds and it return us datetime
- Date, datetime methods
    - `date.addDays(100)` - add number of days passed to a date, and return a new date
    - `MonthsBetween(date)`, `daysBetween(date)`
    - `addHours(hours)` - will add nmber of hours passed and return new datetime
    - `Datetime.getTime() ` - returns long (milliseconds for a given datetime from 1/1/1970 midnight gmt)

- Methods
    - Can we write a method which take two strings and returns a boolean?
        - yes. how?
        ~~~
        public boolean method1(string str1, string str2){
            return boolean;
        }
        ~~~
        - can we call the above method as below...
            - `cls.method1('this', 'that');` //1
            - `Boolean b1 = cls.method1('this', 'that');` //2
    - Can we call a method of class1 from class2's method?
        - Yes, it if is public.
        - How?
            - Create new instance and call the method of class1
    - Can we have methods with same name in same class?
        - Yes *
        - methods must have different parameters (different datatype, or different number of parameters, or both)
        ~~~
        public class class1{
            public string method1(string str1, string str2){//1
                string str = method1(str1);
            }
            public string method1(string str1){//2

            }
            //just focus on parameters, not return type
            public boolean method1(string str1, string str2){//3

            }
        }
        ~~~