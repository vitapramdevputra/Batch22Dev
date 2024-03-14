@isTest //to make class as test class.
public class MethodsDemoTest {
    //test method inside test class
        //static, 
        //it can be public, or private
        //method MUST NOT return anything.
        //method DOES NOT take any parameter
            //we can call methods which accepts parameters, Test methods doesn't have any parameters.
    
    @isTest//to make this method as test method
    public static void testMethod1(){
        MethodsDemo md = new MethodsDemo();
        md.welcomeMessage();
    }
    @isTest
    private static void testMethod2(){
        MethodsDemo md = new MethodsDemo();
        //we can call methods with parameters inside test class.
        md.newMessage('John John');
    }

    @isTest
    static void testMethod3(){
        MethodsDemo md = new MethodsDemo();
        string result = md.returnMessage('John');

        //result = Hey John! nice to meet you buddy. How you doing?
        assert.isTrue(result.contains('Hey John!'));
    }
    @isTest
    static void testMethod4(){
        MethodsDemo md = new MethodsDemo();
        boolean result = md.nameContainsA('John');
        //results ==> false (this is actual test.)
        //assertions
            //checking, if the results are as expected.
        system.assertEquals(false, result);//old way //we are comparing, -> if this pass it means that our method is working as it is suppose to work. 

        
        boolean result2 = md.nameContainsA('Jay');
        //result2 ==> true
        //system.assertEquals(true, result2);
        Assert.areEqual(true, result2); //new way
    }

    //Code coverage
        //we ignore closing brackets line
        //ignore system debugs
        //ignore white space line (blank lines)
        //ignore comments
        //8 lines to test
            //tested 5 lines already

    //NO RETURN
    // @isTest 
    // private static string testMethod3(){

    //     return 'done';
    // }

    //Test methods must have no arguments
    // @isTest
    // private static void testMethod3(string s){

    // }
}