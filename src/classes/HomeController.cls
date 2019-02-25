public class HomeController {

    public HomeController(){
        
    }
    
    public string email {get;set;}
    
    public Product2 getPrdct(){
        id prid = ApexPages.currentPage().getParameters().get('Id');
        Product2 prdct2 = Database.query('Select ProductCode, Name, Image__c, Image_URL__c,Family ,description ,(Select UnitPrice, Product2Id From PricebookEntries) From Product2 WHERE Id = :prid ');
        return prdct2;
    }
    
    public void crtRqst(){
        try{
        if(email.length() == 0 || email.contains('.') == false)
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter value'));
        }
        else{
        Product2 prdct2 = getPrdct();
        Request__c rqst = new Request__c(Name = prdct2.Name, 	Customer_email__c = email);
        insert rqst;
        }
        }
        catch(Exception ex){
            System.debug(ex.getMessage());
        }
    }
}