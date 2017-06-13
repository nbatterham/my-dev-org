public class NewCaseListController {

	public List<Case> getNewCases()
    {
		List<Case> newCases = [SELECT Id,CaseNumber FROM Case WHERE Status='New'];
        return newCases;
    }
}