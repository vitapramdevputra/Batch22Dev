Employee emp = new Employee();

emp.setName('Walter White');
emp.setSalary(78000);

string empName = emp.getName();//this will give us name of emp employee
decimal empSal = emp.getSalary();
//system.debug('Emp name: ' + empName);
system.debug(empName + ' salary is ' + emp.getSalary());


system.debug('--------');

Employee emp2 = new Employee();
emp2.setName('Jesse Pink');
emp2.setSalary(3000);
system.debug('emp2 ==> ' + emp2.getName() + ' salary is ' + emp2.getSalary());

