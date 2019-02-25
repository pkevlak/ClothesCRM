public class SearchController {
    public static String notfound { get; set; }
    public Product2 srch {get;set;}
    
    public SearchController(){
        
    }

    public List<Product2> getSearch(){
        List<Product2> srchres = new List<Product2>();
        string srch = '%' + ApexPages.currentPage().getParameters().get('q') + '%';
        System.debug(srch);
        srchres = [Select ProductCode, Name, Image__c, Image_URL__c,Family ,description ,(Select UnitPrice, Product2Id From PricebookEntries) From Product2 WHERE Name like :srch];
        if(srchres.isEmpty()){
            notfound = 'We dont have such product';
        }
        return srchres;
    }
}