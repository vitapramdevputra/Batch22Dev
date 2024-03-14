@isTest
public class CalculatorTest {
    @isTest
    static void testAdd1(){
        Calculator c = new Calculator();
        integer sum1 = c.add(10, 10);
        Assert.areEqual(20, sum1);
    }

        @isTest
    static void testAdd2(){
        Calculator c = new Calculator();
        integer sum1 = c.add(10, 10, 10);
        Assert.areEqual(30, sum1);
    }

    @istest
    static void testAdd3(){
        Calculator c = new Calculator();
        List<integer> li = new list<integer>{5,10,15,20};
        integer sum = c.add(li);
        Assert.areEqual(50, sum);
    }
}