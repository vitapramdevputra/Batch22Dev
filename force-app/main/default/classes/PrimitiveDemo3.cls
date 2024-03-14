public class PrimitiveDemo3 {
    public void printDateTime(){
        //newInstance
        Date d = Date.newInstance(2022, 10, 10);
        Time t = Time.newInstance(10, 15, 20, 100);
        //2 parameters: date, time
        Datetime dt1 = Datetime.newInstance(d, t);
        system.debug('dt1: ' + dt1);

        //6 parameters: year, month, day, hour, minute, seconds
        Datetime dt3 = Datetime.newInstance(2022, 10, 10, 10, 15, 20);
        system.debug('dt3: ' + dt3);

        //1 parameter: long - milliseconds from 1970 1st Jan midnight
        //if we add 5 days to given date (1/1/1970)
            //6 Jan 1970
            //milliseconds:  1000 milliseconds = 1 second
            //3600000
            //4220000000 milliseconds
        //if we 100 days
            //10 April 1970
        //if we add 500 days
            //July 1971
        Datetime dt4 = Datetime.newInstance(0);
        system.debug('dt4: ' + dt4);

        long l2 = 9106512340000L;//given to us by some external system
        datetime dt5 = datetime.newInstance(l2);
        system.debug('dt5: ' +dt5);

        Datetime dt6 = Datetime.newInstanceGmt(2023, 5, 5, 7, 25, 30);
        system.debug('dt6: '+ dt6);
    }
}