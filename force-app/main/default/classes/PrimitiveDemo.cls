public class PrimitiveDemo {
    //print few primitive datatype variables in print1 method
    public void print1(){
        string batchName = 'Batch 22';
        integer totalCandidates = 22;
        boolean isAdminDone = true;
        
        string batchDescription = 'Batch name is ' + batchName + ', total number of students: ' + totalCandidates + ', is admin training completed? ' + isAdminDone;
        system.debug(batchDescription);
    }

    public void print2(){
        decimal d1 = 55.77;
        decimal d2 = d1/2;
        system.debug(d2);

        long l2 = 987665445541L;
        system.debug(l2);
    }
    public void print3(){
        //Object can hold ANY datatype value.
        Object o1 = 'assigning string';
        Object o2 = true;
        Object o3 = 55;
        Object o4 = 25.33;

        system.debug('o1 ==> ' + o1);
        system.debug('o2 ==> ' + o2);
        system.debug('o3 ==> ' + o3);
        system.debug('o4 ==> ' + o4);

        ID accId = '001Ho00001I5T5AIAV';//ID datatype holds salesforce id (not any other string).
        system.debug(accId);
    }
}