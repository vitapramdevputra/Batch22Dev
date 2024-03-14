public class EmployeeTriggerHandler {
    //write logic to check if join date is in future, then throw error
    public static void validateJoinDate(List<Employee__c> empTriggerNew) {
        for (Employee__c empNew : empTriggerNew) {
            if(empNew.JoinDate__c > Date.today()){
                //empNew.addError('Join date cannot be in future.'); //location TOP OF PAGE
                empNew.JoinDate__c.addError('Join date cannot be in future.'); //location at a particular FIELD.
            }
        }
    }

    public static void countEmployees(List<Employee__c> empTriggerNew, List<Employee__c> empTriggerOld, Map<id, Employee__c> empTriggerNewMap, Map<id, Employee__c> empTriggerOldMap) {
        //collect Department Ids for which we want to re-calculate number of employee's field.
        set<id> dIds = new set<id>();

        if(Trigger.isInsert || Trigger.isUndelete){
            for (Employee__c newEmp : empTriggerNew) {
                if(newEmp.Department__c != null){
                    dIds.add(newEmp.Department__c);
                }
            }
        }

        if(Trigger.isDelete){
            for (Employee__c oldEmp : empTriggerOld) {
                if(oldEmp.Department__c != null){
                    dIds.add(oldEmp.Department__c);
                }
            }
        }

        if(Trigger.isUpdate){
            for (Employee__c newEmp : empTriggerNew) {
                //check if department is changed.
                if(newEmp.Department__c != empTriggerOldMap.get(newEmp.Id).Department__c){
                    dIds.add(newEmp.Department__c); //add new department id to the set
                    dIds.add(empTriggerOldMap.get(newEmp.Id).Department__c); //add old department id to the set
                }
            }
        }
        system.debug('department ids are : ' + dIds);


        //once we have departmentIds 
        if(!dIds.isEmpty()){

            //APPROACH 1
            //soql -> get total employees for each department
            // update departments
            // List<Department__c> listDepartments = [select id, name__c, (select id, first_name__c from employees__r) from department__c where id in :dIds];
            // for (Department__c eachDep : listDepartments) {
            //     integer countEmp = 0;
            //     if(eachDep.Employees__r != null){
            //          countEmp = eachDep.Employees__r.size();
            //     }
            //     eachDep.NumberOfEmployees__c = countEMp;
            // }
            // update listDepartments;


            //APPROACH 2
            List<AggregateResult> employeeCounts = [select Department__c, count(id) from employee__c where department__c in :dIds group by department__c ];

            List<Department__c> depToUpdate = new List<Department__c>();
            for (AggregateResult eachResult : employeeCounts) {
                Department__c d = new Department__c();
                    //a02Ho000038ovNUIAY
                    d.Id = (id)eachResult.get('Department__c');
                    d.NumberOfEmployees__c = (Decimal)eachResult.get('expr0');
                
                depToUpdate.add(d);
            }
            update depToUpdate;
        }
            
    }
}