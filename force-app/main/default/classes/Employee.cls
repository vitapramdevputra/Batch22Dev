public class Employee {
    private string name;
    private decimal salary;

    //we write get and set methods to get value and set value

    //get method of name
    public string getName(){
        return this.name;
        //this. means class variables(or methods)
    }
    //set method of name variable
    public void setName(string name){
        //assign parameter value (name) to Class variable(this.name)
        this.name = name;
    }

    //write get and set method for salary
    public void setSalary(decimal salary){
        //check if salary is set in valid range
        if (salary >= 6000 && salary <= 100000) {
            this.salary = salary;
        } else {
            this.salary = 0;
            system.debug(this.name + ' Salary NOT in valid range. Be in limits buddy');
        }
        
    }
    public decimal getSalary(){
        return this.salary;
    }

    
    public void printDetails(){
        system.debug(name);
        system.debug(salary);
    }

}