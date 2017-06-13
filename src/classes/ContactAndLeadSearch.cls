public class ContactAndLeadSearch {

    public static List<List< SObject>> searchContactsAndLeads(String name)
    {
        List<List<SObject>> searchList = [Find :name IN ALL FIELDS RETURNING Contact, Lead];
        
        return searchList;
    }
}