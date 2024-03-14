# Triggers

- What is trigger?
    - Triggers are pieces of Apex code that execute when records are inserted, updated, deleted, or undeleted in Salesforce. They allow you to automate processes
- When does trigger execute?
    - triggers executes automatically when we insert/update/delete/undelete records.
- Trigger Events
    - `before insert`
    - `after insert`
    - `before update`
    - `after update`

- Order of execution (ugly pipeline)
    - when we save record, it has to go through series of steps to save record in database
        - example
            -  system validation --> before triggers --> custom validation --> saved in db --> after triggers --> (a lot of other stuff) --> committed

- Trigger context variables
    - which us understand in which context the trigger is executing.
        - `Trigger.isBefore, Trigger.isAfter, Trigger.isInsert, Trigger.isUpdate`
    - How can write the code which fires ONLY in `after insert` event
        ~~~
        trigger AccTrigger on Account(before insert, after insert, before update, after update){
            if(Trigger.isInsert && Trigger.isAfter){
                //this code will fire ONLY in after insert context.
            }
        }
        ~~~

- How can we get data in Trigger? Data of records which are inserted/updated.
    - `Trigger.new`
        - `Trigger.new` is list<sObject> 
            - why list? it is always a list.
            - trigger is always bulkified (it is ready to process a list)
        - `Trigger.newMap`
            - it is map of newly inserted/updated record (record is same as `trigger.new`)
            - `Map<id, sObject>`
                ~~~
                trigger ContactTrigger on contact(before insert, after insert, before update, after update){
                    Map<id, contact> conTriggerNewMap = trigger.newMap;
                    list<contact> newMapValues = trigger.newMap.values();
                    set<id> contactIds = trigger.newMap.keySet();
                }
                ~~~
    - if we want to get the previous version of records while updating we use 
    `trigger.old`
        - `trigger.oldMap` - `map<id, sObject>`


- Context variable availability `(before insert =1, after insert =2, before update =3, after update= 4)`
    - `Trigger.new`
        - is Present in All events? `before insert (ID is NULL), before update, after insert, after update`
    - `Trigger.newMap`
        - 3`(before update)`, 4`(after update)`
        - can we get newmap in `before insert`? NO. No id, no map.
        - what about `after insert`? Yes. Yes id, Yes map. 
        - 2,3,4 - we have `newMap`
    - `Trigger.old`
        - in after insert, we get old record?
            - NO
        - we have old records in update
            - 3,4 => `before update`, and `after update`
    - `Trigger.oldMap`
        - in insert trigger, do we old?
            - No. No value, no map.
        - in update trigger. We have `oldMap`
        - 3,4 => `before update`, and `after update`
        
- When to use before vs when to use after?
    - on inserting `account` record, we want to insert a `task(or contact)` record
        - which trigger to use? 
            - Whenever we want to perform DMLs in trigger, it is better to use After
            - We MUST use after insert ONLY, we cannot do it in before insert at all. Because ID is not available in before, and we need ID to establish relationship.
    - When inserting lead, and if 'phone', 'website', 'email', 'first name', 'last name' - if all these fields are present, then MOVE lead to `working' stage as soon as it is inserted. 
        - do we have to update the field of SAME record?
            - yes.
            - we should plan to do it in before.
    - When inserting or updating Employee record, if join date is in past then throw error saying - 'Join date cannot be past'
        - Before. Why?
            - We prefer to add Validations in before triggers. Record will NOT go to Save part, which is more efficient.
         
- How can we add validation in triggers?
    - `addError()` 
        - for insert/update - we can use `addError` for `trigger.new` or `trigger.newMap` - NOT FOR `Trigger.old`
    - can we do validation in after triggers?
        - yes

- Delete trigger
    - `trigger.isDelete` context variable
        - how can we get data in trigger which is being deleted?
            - `trigger.old` and `trigger.oldmap`.
            - `trigger.new`, and `trigger.newMap` will be null.
        - remember for `addError`:
            - for insert/update, we use `.addError` on `new` or `newMap`
            - for delete, we use `.addError` on `old` or `oldMap`
- Undelete trigger
    - We only have 1 event for undelete. `After undelete`
    - trigger context variable to idenfity `undelete` trigger is `trigger.isUndelete`
        - we have `trigger.new` and `trigger.newMap`. 
        - `old` and `oldMap` is null.
    

- After trigger (after insert, after update, after undelete)
    - in after triggers, `trigger.new` is readOnly. We cannot modify it directly.
        - we create new instance, assign id is present and then modify.
        - sample code to update in after insert (or update)
            ~~~
            trigger CaseTrigger on Case (after insert) {
        
                List<case> updateCases = new list<case>();
                for (Case newCase : trigger.new) {
                    Case c = new Case();
                    c.Id = newCase.Id;
                    c.Description = newCase.Description  + '...append something...';
                    updateCases.add(c);
                    //newCAse.Description += 'append something...'; //this will throw error
                }
                update updateCases;
                system.debug('================');
            }
            ~~~

- Trigger executes in batch of 200 records at a time.
    - if we insert/update 1100 records - same trigger will fire 6 times. (IF we have Before insert and After insert then 12 times)

- Governor limits
    - what is governor limit?
        - governor limits are enforced to ensure that all org gets same server resources.
    - which are some of the governor limits?
        - Per transaction governor limits
            - Total DMLs: 150
            - Total SOQL: 100/200
            - Heap Size: 6MB/12MB
            - Total records retrivied by SOQL: 50k
            - DML Rows: 10k
            - Max CPU timeout: 10,000 milliseconds / 60,0000 milli seconds
            - timeout for callouts: 120 seconds
            - maximum apex excution: 10minutes
    
- Annotations
    - changes the behaviour of method or classes.
    - which annotation is used to call methods from P.B or Flows?
        - `@invocableMethod`


