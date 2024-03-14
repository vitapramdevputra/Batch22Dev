//how to use interface?
    //we implement interface
        //and we must implment all methods present in interface.
public class CustomerPurchaseOrder implements iPurchaseOrder{

    public double discount(){
        return 0.05;
    }

    public void addOrder(){
        system.debug('we must implement all the methods of interface');
    }
}