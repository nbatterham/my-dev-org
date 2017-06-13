global class AddPrimaryContact implements Queueable{
    
    private contact cnt;
    private String state;
    
    public AddPrimaryContact(Contact cnt, String state)
    {
        this.cnt = cnt;
        this.state = state;
    }
    
	public void execute(QueueableContext context)
    {
        List<Account> accounts = [SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts) FROM ACCOUNT WHERE BillingState = :state LIMIT 200];
        List<Contact> contacts = new List<Contact>();
        
        for(Account acc : accounts)
        {
            Contact cont = cnt.clone(false,false,false,false);
            cont.AccountId = acc.Id;
            contacts.add(cont);
        }
        
        insert contacts;
    }
}