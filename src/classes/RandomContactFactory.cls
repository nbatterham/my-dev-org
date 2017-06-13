public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer num, String lname)
    { 
        List<Contact> contactsToAdd = new List<Contact>();
        for(Integer i=0; i<num; i++)
        {
            contactsToAdd.add(new Contact(FirstName='Test '+i, LastName=lname));
        }
        
        return contactsToAdd;
    }
}