public with sharing class ClassA {
    public void methodA(){
        //soql here
            //obey or enforce sharing rules that is setup in the org
            //user will get records only accessible to them

        //with sharing is recommended.

        ClassC cc = new ClassC();
        cc.methodC(); //methodC will enforce sharing rules
    }
}