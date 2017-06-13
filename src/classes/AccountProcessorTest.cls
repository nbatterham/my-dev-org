@isTest
private class AccountProcessorTest {
	
    @isTest
    public static void test1()
    {
        Id accountId = createTestAccount();
        Id contactId = createTestContact(accountId);
        
        List<Id> accountIds = new List<Id>();
        accountIds.add(accountId);
        
        Test.startTest();
        	AccountProcessor.countContacts(accountIds);
        Test.stopTest();
    	
        Account a = [SELECT Number_of_Contacts__c FROM Account WHERE Id = :accountId];
        System.assertEquals(1, a.Number_of_Contacts__c);
    }
    
    
    //Helper Methods
    static Id createTestAccount()
    {
        Account accountTest = new Account(Name='Test Account');
        insert accountTest;
        return accountTest.Id;
    }
    
    static Id createTestContact(Id accountId)
    {
        Contact contactTest = new Contact(LastName='Test', AccountId = accountId);
        insert contactTest;
        return contactTest.Id;
    }
}