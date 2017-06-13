public class ContactSearch {
	
    public static List<Contact> searchForContacts(String lname, String pcode)
    {
		List<Contact> ctcs = [Select Name From Contact Where (LastName = :lname AND MailingPostalCode = :pcode)];
    	
        return ctcs; 
    }
}