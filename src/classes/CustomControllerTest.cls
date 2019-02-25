@isTest
public class CustomControllerTest {

    static CustomController cstm = new CustomController();
    
    @isTest
    private static void testFirstbtn(){
        System.Test.startTest();
        
        cstm.Firstbtn();

        System.Test.stopTest();
        
    }
    
    @isTest
    private static void testprvbtn(){
        System.Test.startTest();
        
        cstm.prvbtn();

        System.Test.stopTest();
        
    }
    
    @isTest
    private static void testgetNxt(){
        System.Test.startTest();
        
        cstm.getNxt();

        System.Test.stopTest();
        
    }
    
    @isTest
    private static void testNxtbtn(){
        System.Test.startTest();
        
        cstm.Nxtbtn();

        System.Test.stopTest();
        
    }
    
    @isTest
    private static void testlstbtn(){
        System.Test.startTest();
        
        cstm.lstbtn();

        System.Test.stopTest();
        
    }
    
    @isTest
    private static void testgetPrv(){
        System.Test.startTest();
        
        cstm.getPrv();

        System.Test.stopTest();
        
    }
}