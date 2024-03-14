public class Candidates {
    public string name;
    public string gender;
    public static string companyName;

    public void details(){
        system.debug('===Start====');
        system.debug('name => ' + name);
        system.debug('gender => ' + gender);
        //we can access static members inside non-static method.
        system.debug('company name ' + companyName);
        system.debug('===End====');
    }

    public static void staticDetails(){
        system.debug('company name ==> ' + companyName);
        //system.debug('name => ' + name);//can't do this.
    }
}