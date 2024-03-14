public class Carrr {
    //class variables
    //if no access modifier by default it is private.
    public string name; 
    public string color;
    integer mfgYear;
    decimal price;
    string model;
    boolean isInsured;

    //default constructor OR non-parameterized
    Public Carrr(){
        system.debug('this will be called as soon as new instance is created');
        mfgYear = 2024;
        details();//constructors can call methods inside the same class (without creating an instance) like one method calls another method inside the same class
    }

    //parameterized constructor
    public Carrr(string n){
        //set name of the car
        name = n;
        mfgYear = 2024;
        details();
    }
    public Carrr(string nm, string md, string clr, integer yr, decimal prc, boolean ins){
        name = nm;
        model = md;
        color = clr;
        mfgYear = yr;
        price = prc;
        isInsured = ins;
        details();
    }

    public void details(){
        system.debug('Car Name ==> ' + name);
        system.debug('model ==> ' + model);
        system.debug('Car color ==> ' + color);
        system.debug('Car manufacturing year ==> ' + mfgYear);
        system.debug('$$$$ ' + price);
        system.debug('isInsured? ' + isInsured);
        
    }

}