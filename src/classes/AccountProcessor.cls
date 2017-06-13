global class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> recordIds)
    {
        List<Account> accounts = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account Where Id IN :recordIds];
        for(Account a : accounts)
        {
            List<Contact> c = a.contacts;
            a.Number_of_Contacts__c = c.size();
        }
        update accounts;
    }

}