public class DepartmentTriggerHandler {
    public static void updateShortCode(List<Department__c> depTriggerNew) {
        //write code to check if short code is blank
        for (Department__c newDep : depTriggerNew) {
            if(String.isBlank(newDep.Short_Code__c)){
                //update short code with name's first 3 character in uppercase
                if(newDep.Name__c != null){
                    if(newDep.Name__c?.length() > 3){
                    //then substring
                    string temp = newDep.Name__c.substring(0, 3);
                    newDep.Short_Code__c = temp.toUpperCase();
                    } else{
                        //name is less than or equal to 3 characters.
                        newDep.Short_Code__c = newDep.Name__c?.toUpperCase();
                    }
                }
                
            }
        }
        
    }

    public static void validateName(List<Department__c> depTriggerNew) {
        for (Department__c newDep : depTriggerNew) {
             if(String.isBlank(newDep.Name__c)){
                //throw error
                newDep.addError('Department Name cannot be blank. Be Serious.');
             }
        }
    }
}