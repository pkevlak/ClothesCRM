@isTest
public class RequestControllerExtensionTest {
    
    @isTest
    private static void testredirTest(){
        System.Test.startTest();
        
        RequestControllerExtension.redirTest();

        System.Test.stopTest();
        
    }
    
    @isTest
    private static void testgetSearch(){
        System.Test.startTest();
        
        RequestControllerExtension.getSearch();

        System.Test.stopTest();
    }
    
    @isTest
    private static void testupdatePage(){
        System.Test.startTest();
        
        RequestControllerExtension.updatePage();

        System.Test.stopTest();
        
    }
}