@isTest
public class TestRestrictContactByName {
	
    @isTest
    static void TestContact()
    {
        // Create a Contact with an Invalid Name and a Valid Name then try to insert it
        Contact cont1 = new Contact(LastName='INVALIDNAME');
        Contact cont2 = new Contact(LastName='VALIDNAME');
       	
        List<Contact> con = new List<Contact>();
        con.add(cont1);
        con.add(cont2);
        
        //Perform Test
        Test.startTest();
        Database.SaveResult[] result = Database.insert(con,false); 
        Test.stopTest();
        
        System.assert(!result[0].isSuccess());
        System.assert(result[1].isSuccess());
        System.assert(result[0].getErrors().size() > 0);
        System.assert(result[1].getErrors().size() == 0);
        System.assertEquals('The Last Name "'+con[0].LastName+'" is not allowed for DML', result[0].getErrors()[0].getMessage());
    	
        
    }

}