public class Product2ControllerExtension {
/*
     private final Product2 product;
    
    public string email {get;set;}
    
    public Product2ControllerExtension(ApexPages.StandardController stdController) {
        this.product = (Product2)stdController.getRecord();
    }
    public Product2 getPrdct(){
        id prid = ApexPages.currentPage().getParameters().get('Id');
        Product2 prdct2 = Database.query('Select ProductCode, Name, Image__c, Image_URL__c,Family ,description ,(Select UnitPrice, Product2Id From PricebookEntries) From Product2 WHERE Id = :prid ');
        return prdct2;
    }
    
    public void crtRqst(){
        if(email.length() == 0)
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter value'));
        }
        else{
        Product2 prdct2 = getPrdct();
        Request__c rqst = new Request__c(Name = prdct2.Name, 	Customer_email__c = email);
        insert rqst;
        }
    }*/
}