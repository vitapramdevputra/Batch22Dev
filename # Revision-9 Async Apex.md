# Revision-9 Async Apex

- Synchronous vs Asynchronous
    - sync - sequential. 
        - if we call a method, code waits for that method to get completed, and then continues.
    - async - runs in background
        - if we cann async method, code will wait for async method to complete (it will start another background process), and code will continue to execute.

- how many type of async apex we have?
    - 4.
    - which?
        - `Future`
        - `Batch`
        - `Queueable`
        - `Schedulable`

- Why to use Async? 
    - higher governor limits. Ex: heapsize is 2x, cpu time 6x, soql is 2x
        - for any long running operation we use async apex
    - to call external system (callouts)
    - if we want to execute some apex class at a specific or specific frequency
    - if we want to process (update/insert/delete) huge number of records
        - how many maximum records we can update in one transaction? 10k
            - we will write `batch` apex

- `@future`
    - some little rules for future methods
        - we cannot pass sObject in parameters
            - ONLY primitive datatypes or collections of primitive datatype
        - annotate method with `@future`
        - must be static
        - must return void
            - why return void?
    - can we call future method from before update trigger?
        - we can, but not recommended. We usually call future method in after triggers

- why to use future?
    - higher governor limits
        - we get high cpu time, higher heap size.
    - callouts
    - to resolve mixed dml
        - setup object and non-setup in one transaction gives error. To resolve that we move one of the DML in future method.

- Interface
    - What it is?
        - one template with JUST methods signature (NO METHOD BODY)
    - How to use it?
        - a class has to implement an interface, and implements all the methods specified in interface
        - Example: 
            - interface
                ~~~
                public interface abcInterface{
                    string doSomething();
                }
                ~~~
            - Class
                ~~~
                public class abc implements abcInterface{
                    //here we must implmenet all the methods of abcInterface
                    public string doSomething(){

                    }

                    public void doSomethingMore(){

                    }
                }
                ~~~

- Batch Apex
    - What is it? And why?
        - is used to process huge amount of data.
        - divide the records into chunks (we can decide in how many records per chunk), and process all the records in different batches.
            - each new  chunk or batch will get fresh set of governor  limits.
            - so less chance of hitting governor limits
    - how?
        - `implements Database.batchable<sObject>`
            - 3 methods we must implement
                - `start(Database.BatchableContext bc)`
                    - executes first.
                    - fetch data in start, and return QueryLocator
                - `execute(datbase.batchableContext bc, list<sObject>)`
                    - may be called many times depending on amount of data we have
                    - it will be called to process each chunk of records
                - `finish(Database.BatchableContext bc)`
                    - once all the records are processed, finish method will be called.
    - how can we keep count of success/fail records in entire batch?
        - we must implement `database.stateful` along with batchable

- how to write test for batch apex?
    - same as any other async apex test
        - prepare data (100 records)
        - Test.startTest();
        - executeBatch(new ab(), 100) -- the only thing we need to keep in mind is DO NOT divide data in different batches. ONLY 1 CHUNK.
        - Test.stopTest();
        - assert

- Queueable
    - used to perform async apex.
    - we can get queued job id
    - pass non-primitive datatype while enqueuing job.
    - chain queueable - we can call one queueable from another.

- Test for queueable
     - same as any other async apex test
        - prepare data (100 records)
        - Test.startTest();
        - system.enqueueJob()
        - Test.stopTest();
        - assert

- Future method is not allowed from batch. (directly or indirectly)
    - in batch we are updating Account
        - in account trigger we are calling a future method
            - indirectly we call future method from batch - it will throw error.

- Schedulable:
    - it is one of the interface used to schedule job to run at a specific time.
    - Can we schedule a job to run every 5 minutes?
        - no. We can do it every hour.
    - Can we schedule a job without any end date?
        - if we are scheduling from UI, enddate is mandatory.
        - if schedule via code, we don't have enddate.
    - how can we schedule via apex code?
        - we have to prepare cron expression
            ~~~
            string cronexp = '0 0 13 * * ?';
            system.schedule('account schedule anon', cronExp, new AccountSchedulable());
            ~~~
    