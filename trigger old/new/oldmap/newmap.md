# Revision of new/old/newMap/oldMap

List<account> accTriggerNew = trigger.new; //trigger.new is LIST<sObject>
List<account> accTriggerOld = trigger.old;
Map<id, account> accTriggerNewMap = trigger.newMap;
Map<id, account> accTriggerOldMap = trigger.oldMap;

when insert, NO OLD.


Trigger.new in Before Insert
 - account(id=null, name=a)
 - account(id=null, name=b)
 - account(id=null, name=c)

Trigger.newMap in Before insert
 - NULL.


Trigger.new in After Insert
 - account(id=001a, name=a)
 - account(id=001b, name=b)
 - account(id=001b, name=c)

Trigger.newMap in After Insert
 - 001a => account(id=001a, name=a)
 - 001b => account(id=001b, name=b)
 - 001c => account(id=001b, name=c)

-----------------------------

UPDATE (we are updating name for all 3 accounts)

Before update Trigger.old
Trigger.old in Before update
 - account(id=001a, name=a)
 - account(id=001b, name=b)
 - account(id=001b, name=c)

Before update Trigger.oldMap
 - 001a => account(id=001a, name=a)
 - 001b => account(id=001b, name=b)
 - 001c => account(id=001b, name=c)


Before update Trigger.new
 - account(id=001a, name=ax)
 - account(id=001b, name=by)
 - account(id=001b, name=cz)

Before update Trigger.NewMap
 - 001a => account(id=001a, name=ax)
 - 001b => account(id=001b, name=by)
 - 001c => account(id=001b, name=cz)
