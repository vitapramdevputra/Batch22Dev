List<account> someAcc = [select id, name from account order by createddate desc limit 10];

AccountQueueableDemo aq = new AccountQueueableDemo(someAcc);

id queueJobId = System.enqueueJob(aq); //enqueuing the queueable.
system.debug('job id => ' + queueJobId);

AsyncApexJob jobStatus = [SELECT Id, Status,  ApexClassId, NumberOfErrors FROM AsyncApexJob where id= '707Ho00009RKesF'];
system.debug('jobStatus: ' + jobStatus);