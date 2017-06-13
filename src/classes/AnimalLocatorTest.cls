@isTest
private class AnimalLocatorTest {
	
    @isTest
    static void test1()
    {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        string result = AnimalLocator.getAnimalNameById(1);
        
        System.assertEquals(result,'chicken');
    }
}