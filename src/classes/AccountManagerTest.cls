@isTest
private class AccountManagerTest {

    @isTest(SeeAllData=true)
    static void testGetAccountById()
    {
        Id accountId = createTestAccount();
        Id contactId = createTestContact(accountId);
        RestRequest request = new RestRequest();
        request.requestURI='https://ap4.salesforce.com/services/apexrest/Accounts/'+accountId+'/contacts';
    	request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account a = AccountManager.getAccount();
       
        System.assert(a !=null);
        System.assertEquals('Test Account', a.Name);
        //System.assertEquals('Test',a.Contact.Name);
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