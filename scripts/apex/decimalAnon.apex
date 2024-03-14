decimal d1 = 10.0/3;
decimal d2 = d1.setScale(2);
system.debug(d2);

string s2 = d2.toPlainString(); //convert 3.33 to string '3.33'
system.debug(s2+2);

string s3 = '987.15';
decimal d3 = Decimal.valueOf(s3);
system.debug(d3+2);