public class BookTickets {

    public static string movieName = 'Forrest Gump';
    static integer totalSeats = 120;
    public static integer availableSeats = 120;

    public integer bookSeats;
    public string name;

    public void book(){
        //when we book tickets reduce the number of total seats
        availableSeats = availableSeats - bookSeats;
        system.debug(name + ' booked ' + bookSeats + ' seats for movie: ' + movieName);
    }

    public static void staticDetails(){
        
    }

   
}