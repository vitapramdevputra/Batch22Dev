LoopDemo ld = new LoopDemo();
ld.printOddIntegers(4, 12);
ld.printIntegers(-10);
ld.printHello();
ld.print_int_while();
ld.print_1_while();






//print 0,1,2,3,4,5

integer i = 0;
string printStr = '';
while(i <= 5){
    printStr += i + ',';
    //system.debug(printStr);
    i++;
}
system.debug('final => ' + printStr.removeEnd(','));



