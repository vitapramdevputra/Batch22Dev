# Tests

- What is unit test?
    - when we test the smallest possible unit of a code we call it unit test. It can be a method of a part of method.
- What is apex unit tests?
    - We write apex classes (test classes) to test the code we wrote earlier.
    - How can create apex test classes?
        - annotate it with `@isTest`
        - inside test classes, we write testmethods to test any logic.
        - for test method also we have to write `@isTest`
            - other criteria for test methods?
                - static. 
                - no parameters allowed
                - public or private.
                - no return type
                - we must write assertions
                - and finally, annotate with `@isTest` or write `testmethod` keyword
                - in a testClass we must have atleast one testmethod.
        - it is allowed to write NON-TEST method inside a test class.
- What is code coverage?
    - the code is tested from test method. 
    - lines covered from total lines, it will give us % code coverage
    - we have to target close to 100%
    - we write code in sanbox. We test it normally.
    - then we write test classes.
    - ensure that code coverage is atleast 75% (salesforce says so.) (> 90% )
        -> then we can move code to production. 
            > 4 classes
                - class 1 -- 100 lines -- 95 lines
                - class 2 -- 20 lines -- 15 lines
                - class 3 -- 50 lines -- 45lines
                - class 4 -- 10 lines -- 1 line tests (10%) (it should NOT be ZERO)
- What is assertion? How to write assertions?
    - we verify results by comparing the actual result and the expected one
    - can code coverage be 100% without writing assertions?
        - yes, it can be done. But usually it makes no sense to write a test without asserstion.
    - assertions are important because this verifies the results.
        - if something goes wrong in our logic then assertion fails and we know that we must fix our code.
    - How to write?
        - Old Way
            - we use `system` class and `assert methods`
            - `system.assertEquals(expected, actual)`, `system.assert(boolean)`
        - New way
            - we have dedicated class `assert`
            - `Assert.areEqual(expected, actual)`
            - `Assert.isTrue(boolean)`
- Write tests for DML and SOQL
    - We are inserting 100 records in our test method. How many records inserted in the org?
        - zero.
    - If we directly write SOQL to fetch accounts or any other object in test method. 
        - by default, we will NOT get any records in test method.
    ~~~
    public static void dml7() {
        //how can we get account id of softinnovas account
        Account acc = [select id, name from account where name = 'softinnovas' limit 1];

        //create related contact record
        Contact c2 = new Contact();
        c2.FirstName = 'Joe';
        c2.LastName = 'Biden';
        c2.accountid = acc.id; //set account id relationship
        insert c2;
        
    }
    ~~~
    - Write Test for above method
    ~~~
    testmethod(){
        //1. prepare data
            //what data we need to prepare to test dml7?
                //either we have to create account or contact or both. 
            //prepare account record with name 'softinnovas'

        //2. call method

        //3. assertion
            //how do we assert if our method ran successfully?
                //query first. what do query?
                //we query contact

    }
    ~~~
            
- Q: we are writing a test class, and we get heap size governor limit (or any limitException) in one of the test method, how can we resolve that?
    - `Test.startTest()` `Test.stopTest()`
- Q: how prepare common data in a test class which can be used in all its test methods?
    - `@TestSetup`

- How to write test for triggers and trigger handlers?
    - we don't need to call triggerHandler methods explicitly.
    - we JUST insert/update data in a way that trigger code, and its handler code is covered.
        - and we assert whatever handler method is doing.

- how can we read data from org in test class? or we cannot at all?
    - `@isTest(seeAllData=true)` [not recommended at all]
- make private methods accessible by test class
    - `@testVisible`
