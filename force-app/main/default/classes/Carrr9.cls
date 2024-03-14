public class Carrr9 {
    //is a constructor
    //same name as class name
    //does NOT return anything.
    // public Carrr9() {
    //     //how to call consturctor?
    //         //it is automatically called when new instance is created.
    //     system.debug('carrr9 instance(or object) is created');
    // }

        //if have any constructor then we can create instance USING that constructor ONLY.
        //but if we DO NOT HAVE ANY Constructor then we can use the default one (parameterless constructor)
    public Carrr9(string name){
        system.debug(name);
    }
    public void details(){
        system.debug('carrr9 details');
    }
    
}