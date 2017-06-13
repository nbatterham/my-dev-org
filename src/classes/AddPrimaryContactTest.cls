@isTest
private class AddPrimaryContactTest {
	
    @testSetup
    static void setup()
    {
        List<Account> accountList1 = new List<Account>();
        List<Account> accountList2 = new List<Account>();
        
        for(Integer i=0; i<50; i++)
        {
            accountList1.add(new Account(Name='Test'+i, BillingState='Ny'));
            accountList2.add(new Account(Name='Testing'+i, BillingState='CA'));
        }
        insert accountList1;
        insert accountList2;
    }
    
    @isTest
    static void test()
    {
        Contact cnt = new Contact(FirstName='Test', LastName='Testing');
        AddPrimaryContact apc = new AddPrimaryContact(cnt, 'CA');
        
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
        
        List<Account> accts = [SELECT Id, (SELECT Id FROM Contacts WHERE FirstName ='Test' AND LastName = 'Testing') FROM Account WHERE BillingState='CA'];
        System.assertEquals(50, accts.size());
    }
}