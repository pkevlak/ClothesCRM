@isTest
public class SearchControllerTest {
    
    static SearchController sc = new SearchController();

    @isTest
    private static void testgetSearch(){
        System.Test.startTest();
        
        sc.getSearch();

        System.Test.stopTest();
    }
}