DatetimeDemo dt = new DatetimeDemo();
dt.offerEndDT();
dt.subscriptionEndDate();
dt.calculateAge();

//getTime -> datetime in milliseconds (from 1st Jan 1970)
Datetime vbirthdate = Datetime.newInstanceGmt(1990, 10, 9, 2, 0, 0);//send this datetime to external system in long
long longBirthDate = vbirthdate.getTime();

system.debug('Vitap birthdate: ' + longBirthDate);