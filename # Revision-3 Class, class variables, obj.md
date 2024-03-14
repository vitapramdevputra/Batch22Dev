# Revision-3 Class, class variables, object, contructor


- Class, variables, contructor, object
    - Why class?
        - to save some reusable code which we can repeatedly from several places.
        - to create structured data (not to store the data), but to pass from one place to another
    - What are class variable? How can we create class variables? (other name is global variables)
    - What is constructor? How can we create constructor?
        - name is same as class name.
        - no return type
        - how to call constructor?
            - when we create object (instance of class), constructor is called automatically.
        - can we have multipe constructors?
            - yes, we can have multiple constructors.
            - we can have multiple constructors with different number of parameters.
            - we can have multiple constructors with different type of parameters.
        - What do we do with parameterized constructor?
            - we can assign the values to class variables.
        ~~~
        public class SampleClass{
            //we can use (get or set) public variables from anywhere inside the class and outside the class
                //what is the difference between get and set?
                    //get: we can read the value
                    //set: we can assign (update) the value
            public string var1;
            public integer var2;
            //we can use private variables only inside the class
            string var3; //is this correct? Yes. It is a private variable.
            private string var4;

            //constructor
            public SampleClass(){
                //do something
                //we can assign the default values to class variables
                var1 = 'some value';
                var2 = 10;
                //can we call another method from constructor?
                method1();
            }

            //parameterized constructor
            //1. we want to create constructor which helps us in assigning all 4 class variable values.
            public SampleClass(string vr1, integer vr2, string vr3, string vr4){
                //do something
                //we can assign the default values to class variables
                var1 = vr1;
                var2 = vr2;
                var3 = vr3;
                var4 = vr4;
            }
            //2. we want to create constructor which helps us in assigning all private class variable values.
            public SampleClass(string vr3, string vr4){
                //do something
                //we can assign the default values to class variables
                var3 = vr3;
                var4 = vr4;
            }

            public void method1(){
                var3 = 'some value'; //setting
                system.debug(var); //getting

                //comparision means getting value because we are reading the value, we are NOT updating
                if(var2 == 15){
                    //do something
                }

            }

        }

        ~~~

        ~~~
        //how to create object?
        SampleClass obj1 = new SampleClass();
        obj1.var1 = 'some value';//is this correct? Yes. It is a public variable.
        //obj1.var3 = 'some other value';//is this correct? No. It is a private variable.
        
        SampleClass obj2 = new SampleClass('some value', 10, 'some other value', 'some other, other value');
        obj2.method1();

        SampleClass obj3 = new SampleClass('some value var3', 'some other vlaue var4');
        obj2.method1();
        ~~~

- Difference and similarities between Method and Constructor.
    - Method
        - it can be ANY NAME.
        - we can return something from method
        - we have to method explicitly. Objectname.methodName();
        - method can accept parameters
        - WE MUST write all method. No such thing as default method.

    - Constructor
        - name is same as Class Name
        - no return type
        - it is called automatically when new instance is created.
        - consturctor can also accept parameters
        - one default constructor is present behind the scenes if we don't write any constructor. If we write one then default one goes away.
    
- getter setter methods
    - what do we mean by getter/setter and why do we need them?
        - from outside of the class - we assign values to class variables using setter, and we retrieve values of class variables using getter
    - we can also validate variables values while it is being set in setter methods
    - Example
    ~~~
    public class SampleClass2{
        private string var3;
        private date var4;

        //in get method we return the value of class variable
        public string getVar3(){
            return var3;
        }
        //in set method we accept the value and assign it to class variable
        public void setVar3(string var3){
            //this. represents class variable
            this.var3 = var3;
        }

        public date getVar4(){
            return var4;
        }
        public void setVar4(date var4){
            //var4 cannot be in future
            if(var4 <= date.today()){
                this.var4 = var4;
            } else {
                this.var4 = date.today();
            }
        }
    }

    ~~~
- `public, private, global`
    - these are access modifier.
        - it means, it gives information of Where we can access class and its members
    - the main class can be `Public` or `Global`
    - What do we mean by `global`?
        - if class, and its member (variable or method) is global, then it is accessible from outside of the org (via api or some UI) or outside of the package 
    - What about `public`?
        - public class and public members (variable or method) is accessible from anywhere within the org or within the package. 
    - What about `private`?
        - private members are accessible only within the class.

- static, non-static
    - is below code correct?
    ~~~
    public class SampleClass2{

        public void method1(){
            static string str = 'is this correct'?; //NO
        }

        public static void method2(){
            static string str = 'is this correct'?; //NO
        }
    }
    ~~~
    - we can create a static member using `static` keyword.
    - `static` variable are created directly inside class.
        - we cannot create static variables inside a method.
        - local variables cannot be static or non-static.
        - ONLY `Class variables` can be `static`
    - sample code to create static variable/method
    ~~~
    public class SampleClass2{
        static string str = 'is this correct'?; //yes, works.

        //non-static method
        public void method1(){
            system.debug('non-static method.');
            //can we call static method from non-static? Yes.
            method3();
        }

        //static method
        public static void method2(){
            system.debug('static method');
            //can we call another static method from here? Yes
            method3();
        }
        publci static void method3(){
            //can we access static variable here? Yes
            system.deebug(str);

            //can we call non-static method from here?
            method1();//NO way.
        }
    }
    ~~~
    - how to call static vs non-static method
        ~~~
        //for static, directly call it via class name
        SampleClass2.method2();

        //for static, create new instance and then call method
        SampleClass2 sc = new SampleClass2();
        sc.method1();

        SampleClass2 sc2 = new SampleClass2();
        sc2.method1();
        ~~~
    - Static method and variables belongs directly to class. 
        - static method and variables has NOTHING to do with instance.
    - non-static method and variables belongs to instance of class. 
    - From Non-static methods
        - we can access non-static methods and static methods both.
    - from statid methods
        - we can access ONLY static methods and static variables.
        - We CANNOT access non-static members.

- One extra explanation
    - Click on button
        - static variable ClassA.count
        - static apex method is called. (method1 of ClassA)
            - we are using ClassB, ClassC, ClassD, ClassE
                - ClassA --> ClassB (ClassA.count++)
                - ClassB --> ClassC (ClassA.count++), and ClassD (ClassA.count++)
                - ClassD --> ClassE (ClassA.count++)
            - we are again coming back in ClassA (ClassA.count++)
        - if we have a static variable, if its value is assigned when the apex method is first called.
            - we can use the same value or update it throughout the execution

