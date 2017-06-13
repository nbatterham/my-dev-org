public class AccountHandler {

    public static Account insertNewAccount(String accountName)
    {
        Account acct = new Account(Name=accountName);
            
        try{
            insert acct;
        } catch (DMLException e) {
            return null;
        }
        
        return acct;
        
    }
}