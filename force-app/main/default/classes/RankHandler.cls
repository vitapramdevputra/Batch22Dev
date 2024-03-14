public class RankHandler {
    //return prize from rank
   public string rankPrize(integer rank){
        //rank is 1 => gold, 2 => silver, 3 => bronze, 4-10 => aluminium, 11+ => wooden
        string prize = '';

        //write logic to assign prize
        if(rank <=0){
            prize = 'Chewing gum';
        }
        else if (rank == 1) {
            prize = 'Gold';
        } else if (rank == 2) {
            prize = 'Silver';
        } else if (rank == 3) {
            prize = 'Bronze';
        } else {
            if (rank > 3 && rank < 10) {
                prize = 'Aluminium';
            } else {
                prize = 'Wood';
            }
        }


        return prize;
   }

   public string rankPrizeSwitch(integer rank){
    string prize = '';
    //variable datatype can be string, integer, long, sObject
    switch on rank{
        when 1{
            prize = 'gold switch';
        } 
        when 2{
            prize = 'silver switch';
        } 
        when 3{
            prize = 'bronze switch';
        }
        //when else block is optional
        when 4,5,6,7,8,9,10{
            prize = 'aluminium switch';
        }
        when else{
            prize = 'wooden switch';
            // if (rank <= 0) {
            //     prize = 'chewing gum switch';
            // } else {
            //     prize = 'wooden switch';
            // }
        }
    }

    return prize;
   }
}