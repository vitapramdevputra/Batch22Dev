public class SampleClassForStatic {

    //public, private, global represents WHERE we can access
    //static, non-static represents HOW we can access
    
    public static string sampleStaticStr;//static variable
    private static string sampleStaticPrivateStr;

    public string sampleStr;//non-static variable or instance variable
    private string samplePrivateStr;



    public static void sampleStaticMethod(){//static method
        system.debug('sampleStaticMethod');
        //we cannot access non-static variable or method from static method
        // system.debug(sampleStr); //cannot access non-static variable
        // sampleMethod();
    }

    public void sampleMethod(){//non-static method or instance method
        system.debug('sampleMethod');
    }

}