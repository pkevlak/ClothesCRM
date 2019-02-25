@isTest
public class Product2ControllerExtensionTest {
    
    @isTest
    private static void testredirOnMain(){
        System.Test.startTest();
        
        Product2ControllerExtension.redirOnMain();
        
        System.Test.stopTest();
    }

}