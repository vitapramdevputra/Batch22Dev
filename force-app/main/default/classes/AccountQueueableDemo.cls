public class AccountQueueableDemo implements Queueable {
    
    list<account> acc = new list<account>();
    public AccountQueueableDemo(List<account> acc) {
        this.acc = acc;
    }


    public void execute(QueueableContext qc){
        for (Account eachAcc : acc) {
            eachAcc.Name += ' -- SI';
        }
        update acc;
    }
}