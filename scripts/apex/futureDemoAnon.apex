system.debug('---calling non-future method NOW.');
FutureMethodDemo.nonFutureMethod();
system.debug('---DONE with non-future method.');

system.debug('=== calling FUTURE method NOW.');
FutureMethodDemo.futureMethod();
system.debug('=== DONE with FUTURE METHOD');
