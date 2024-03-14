MethodsDemo md2 = new MethodsDemo();
boolean check1 = md2.nameContainsA('Tina');
system.debug('Tina name contains a? ' + check1);

string greeting1 = md2.returnMessage('Jenny');
system.debug(greeting1);

md2.returnMessage('Hey');




MethodsDemo md = new MethodsDemo();
md.welcomeMessage(  );
system.debug('----------');
md.newMessage('Hank');

//md.newMessage();//no work
//md.newMessage(99);//no work
md.newMessage(''); //valid
md.newMessage(null); //valid

string myName = 'Anthony';
md.newMessage(myName);//works

