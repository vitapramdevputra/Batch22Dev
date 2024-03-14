system.debug('1. total avaialble seats : ' + BookTickets.availableSeats);
system.debug('total seats in theater: ' + BookTickets.totalSeats);//since it is private, we can't get this value here.

BookTickets t1 = new BookTickets();
t1.name = 'Tom';
t1.bookSeats = 9;
t1.book();//this will update available seats. //once this method is completed. 

system.debug('2. total avaialble seats : ' + BookTickets.availableSeats);

BookTickets t2 = new BookTickets();
t2.name = 'Jenny';
t2.bookSeats = 5;
t2.book();

system.debug('3. total avaialble seats : ' + BookTickets.availableSeats);

t1.bookSeats = 10;
t1.book(); //code will wait till book method is completed.

system.debug('4. total avaialble seats : ' + BookTickets.availableSeats);
