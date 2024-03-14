public class MethodsDemo {
    //before parameterized method
    public void welcomeMessage(){
        system.debug('Hi there! welcome to apex world');
    }

    //paremeterized method
    public void newMessage(string name){
        //system.debug(name);r
        system.debug('Hi ' + name + '! Welcome to apex world. Enjoying?');
    }

    public string returnMessage(string name){
        string returnStr = 'Hey ' + name + '! nice to meet you buddy. How you doing?';
        return returnStr;
    }

    //# of parameters = 1
    //datatype is string
    //return boolean
    public boolean nameContainsA(string name){
        boolean check = name.containsIgnoreCase('a');
        return check;//returning
    }
}