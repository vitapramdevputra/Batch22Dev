public class DatetimeDemo {
    public void calculateAge(){
        //today's date
        date today = date.today();
        date vbirthDate = date.newInstance(1990, 10, 9);

        //get the age in months
        integer ageInMonths = vbirthDate.monthsBetween(today);
        //age in days using daysBetween method
        integer ageInDays = vbirthDate.daysBetween(today);

        system.debug('Vitap age in months: ' + ageInMonths);
        system.debug('Vitap age in days: ' + ageInDays);
    }

    public void subscriptionEndDate(){
        //starting subscription today for 1000 days
        //get end date

        Date startDate = date.today();
        Date endDate = startDate.addDays(1000);
        system.debug('subscription end date: ' + endDate);
        integer endDateYear = endDate.year();//2026
        integer endDateMonth = endDate.month();//10
        system.debug('end date year and month: ' + endDateYear + ', ' + endDateMonth);
        //subscription ended today of 1000 days. When did you started?

    }

    public void offerEndDT(){
        //offer is starting now, and ending in 51 hours. Print end date time
        Datetime offerStart = datetime.now();

        datetime offerEnd = offerStart.addHours(51);
        system.debug('offerstarted at: ' + offerStart);
        system.debug('offer will end at: ' + offerEnd);
    }
}