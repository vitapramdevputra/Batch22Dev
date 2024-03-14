public class AccountUpdateHelper {
    //method MUST be static.
    //it MUST be public or global.
    //accepts ONLY 1 parameter.
    //ONLY 1 invocable method PER class is allowed.
        //return can be null or List

    @InvocableMethod(label='acc default website' description='set account\'s default website')
    public static void updateWebsite(List<id> accIds) {
        //update default website to 'www.catch22.com'

        List<account> accToUpdate = new list<account>();
        for (Id eachId : accIds) {
            Account a = new account( id = eachId, Website = 'www.catch22.com');
            accToUpdate.add(a);
        }
        update accToUpdate;
    }
}