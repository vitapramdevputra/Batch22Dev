Carrr c1 = new carrr(); //also want to call details method automatically

Carrr c2 = new carrr('Ford Mustang');

//class is like a custom object
    //class variables are like fields
//instance are like records (data) we create in that custom object

Carrr c3 = new Carrr('Murat', '131 ', 'Black', 2021, 10000, true); 
system.debug('name and color of c3: ' + c3.name + ', ' + c3.color );
c3.details();


Carrr c4 = new Carrr('Murat', '124 ', 'White', 1995, 10000, false);
c4.price = 500; //limitation. we cannot change because it is private.
c4.details();




Carrr c5 = new Carrr(); //call line 12
system.debug('------------');
c5.name = 'Toyoto Fortuner';
c5.color = 'White';
c5.details();

system.debug('==========');
Carrr c6 = new Carrr('Kia Sonnet');
system.debug('------------');
c6.color = 'Black';
c6.details();//non-static method or instance method
