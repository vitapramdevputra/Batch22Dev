public class MapDemo {
   public static void map1() {
        //Map<key, value>
            //key is string datatype
            //value is integer datatype
        Map<string, integer> map1 = new map<string, integer>();
        //put method is used to add key-value pair in maps
        map1.put('one', 101); //datatype of key and value must match
        map1.put('two', 202);
        map1.put('two 0 two', 202);
        map1.put('three', 303);
        map1.put('one', 1001);
        map1.put('One', 101);
        system.debug('map1 ==> ' + map1);
        system.debug('map1.size ==> ' + map1.size());
   }

   public static void mapItemPrices(){
        Map<string, decimal> itemPrices = new map<string, decimal>();
        itemPrices.put('Apple', 2.5);
        itemPrices.put('Orange', 3.5);
        itemPrices.put('Banana', 4.5);
        itemPrices.put('Grapes', 5.5);
        itemPrices.put('Apple', 2.5);
        itemPrices.put('Apple', 3.5);
        itemPrices.put('Mango', 5.5);
        itemPrices.put('Kiwi', 4.5);
        itemPrices.put('Watermelon', 5.99);
        itemPrices.put('Strawberry', 2.99);
        system.debug('itemPrices ==> ' + itemPrices);
        system.debug('itemPrices.size ==> ' + itemPrices.size());

        //we need two different maps
            //higher map with key value pair for items more than or equal 4
            //lower map with key value pair for items less than 4
        Map<string, decimal> higherMap = new Map<string, decimal>();
        Map<string, decimal> lowerMap = new Map<string, decimal>();

        for(string eachFruit: itemPrices.keySet()){
            //get value of eachFruit
            decimal price = itemPrices.get(eachFruit);
            if(price >= 4.0){
                //add to higher map
                higherMap.put(eachFruit, price);
            } else {
                //add to lower map
                lowerMap.put(eachFruit, price);
            }
        }
        system.debug('HIGHER MAP: ⤴️ ' + higherMap);
        system.debug('LOWER MAP: ⤵️' + lowerMap);
   }
   public static string retrieveMonth(integer m){
        string monthName;

        //write the logic to populate correct monthName

        map<integer, string> monthMap = new Map<integer, string>();
        monthMap.put(1, 'January');
        monthMap.put(2, 'February');
        monthMap.put(3, 'March');
        monthMap.put(4, 'April');

        monthMap.put(5, 'May');
        monthMap.put(6, 'June');
        monthMap.put(7, 'July');
        monthMap.put(8, 'August');

        monthMap.put(9, 'September');
        monthMap.put(10, 'October');
        monthMap.put(11, 'November');
        monthMap.put(12, 'December');
        
        if(monthMap.containsKey(m))
            monthName = monthMap.get(m);
        else 
            monthName = 'No such month exist. Please behave';

        return monthName;
   }
}