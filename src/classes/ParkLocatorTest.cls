@isTest
private class ParkLocatorTest {
	
    @isTest
    static void testCallout()
    {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'Germany';
        String[] parks = ParkLocator.country(country);
    }
}