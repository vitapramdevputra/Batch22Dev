public class AccountSchedulable implements schedulable{
    public void execute(SchedulableContext sc){
        //start batch 
        AccountUpdateBatch ab = new AccountUpdateBatch();
        Database.executeBatch(ab, 50);
    }
}