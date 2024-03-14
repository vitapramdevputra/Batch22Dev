public inherited sharing class ClassC {
    public void methodC(){
        //soql in this method will inherit sharing rules from where it is called.

        //if this method is called from ClassA
            //then it will enforce sharing rules

        //if method is called from ClassB
            //it does not enforce sharing rules (without sharing)

        //if called from below if will work as 'with sharing'
            //trigger
            //button click (vf page, aura, lwc)
            //flows
            //api's(integration)
    }
}