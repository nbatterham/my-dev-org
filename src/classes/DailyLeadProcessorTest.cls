@isTest
private class DailyLeadProcessorTest {
    
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    @testSetup
    static void setup()
    {
        List<Lead> leads = new List<Lead>();
        for(Integer i=0; i<200; i++)
        {
            leads.add(new Lead(LastName = 'Test'+i, Company='Testing'+i));
        }
        insert leads;
    }
    
    @isTest
    static void test()
    {
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
           
    }
}