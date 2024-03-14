public class PrimitiveDemo2 {
    public void printDate(){
        //create new date variables

        //we have to use date method to create new date instance
        //date.newInstance(year, month, day)
        Date dt1 = Date.newInstance(2024, 05, 15);
        system.debug('date 1: ' + dt1);

        Date dt2 = Date.newInstance(1994, 01, 10);
        system.debug('date 2: ' + dt2);

        Date todayDate = date.today();
        system.debug('today\'s date is ' + todayDate);
        system.debug('today\'s date is (print in new line) \n ' + todayDate);
    }

    public void printTime(){
        //newInstance(hour, minutes, seconds, milliseconds)
        Time t1 = Time.newInstance(15, 25, 50, 250);
        system.debug(t1);

        Time t2 = time.newInstance(8, 18, 54, 400);
        system.debug(t2);

        Time t3 = time.newInstance(28, 18, 54, 400);
        system.debug(t3);
    }

    public void printDateTime(){
        Date d1 = date.today();
        Time t1 = time.newInstance(8, 18, 54, 400);

        //datetime.newInstance(date, time)
        Datetime dt1 = Datetime.newInstance(d1, t1);
        system.debug('dt1 ==> ' + dt1);

        //to get current time
        Datetime dt10 = Datetime.now();
        system.debug('current datetime: ' + dt10);
        //when we print datetime, it always print GMT

        //create new datetime using Year, month, day
        Datetime dt2 = Datetime.newInstance(2024, 01, 05); //12:00 AM
        //it will create a new datetime, considering the time as midnight for current user's timezone, when it prints, it prints in GMT.
        system.debug('dt2: ' + dt2);

        //newInstance(year, month, day, hour, minute, seconds)
        Datetime dt3 = Datetime.newInstance(2022, 4, 25, 9, 15, 30);
        system.debug('dt3 : ' + dt3);
    }
}