trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	
	List<Task> tasksToAdd = new List<Task>();    
    
    for(Opportunity opp :[SELECT Id, StageName From Opportunity Where Id IN :Trigger.new])
    {
        Task temp = new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id);
    	tasksToAdd.add(temp);
    }
    
    upsert tasksToAdd;
   
}