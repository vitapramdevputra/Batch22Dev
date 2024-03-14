//set company name to softinnovas
Candidates.companyName = 'Softinnovas';
Candidates.staticDetails();


//set name and gender
Candidates c1 = new Candidates();
c1.name = 'Jerry';
c1.gender = 'Male';
c1.details();//old //assume it is async
//c1.companyName = 'Comedy club';//not possible. //static variable

Candidates c2 = new Candidates();
c2.name = 'Elaine';
c2.gender = 'Female';
c2.details();//old

Candidates c3 = new Candidates();
c3.name = 'George';
c3.gender = 'Male';
c3.details();//old

system.debug('****company name changed****');
Candidates.companyName = 'Vandeley Insdustries';
Candidates.staticDetails(); //new
c1.details(); //new
c2.details(); //new
