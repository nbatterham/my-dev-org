@isTest
public class TestVerifyDate
{
	static testMethod void testMethod1()
    {
        Date d = VerifyDate.CheckDates(System.today(),System.today()+1);
        Date d1 = VerifyDate.CheckDates(System.today(),System.today()+60);
        
        System.assertEquals(d, System.today()+1);
        System.assertEquals(d1, Date.newInstance(2017, 1, 31));
        
    }
}