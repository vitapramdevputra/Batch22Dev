public without sharing class ClassB {
    public void methodB(){
        //does not enforce sharing rules that is setup in the org
        //user will get all the records

        //should not be used a lot. Use it wisely, or not at all.

        ClassC cc = new ClassC();
        cc.methodC(); //methodC does not enforce sharing rules
    }
}