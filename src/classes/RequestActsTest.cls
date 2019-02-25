@isTest
public class RequestActsTest {

    @isTest
    private static void testaddInfoToRequest(){
        Customer__c cstmr = new Customer__c(Name = 'Paul', Email__c = 'pauloosha@mail.ru');
        insert cstmr;
        Product2 prdct = new Product2(Name = 'Jeans');
        insert prdct;
        Request__c rqst = new Request__c(Product__c = prdct.id, Customer__c = cstmr.id, Customer_email__c = 'pauloosha@mail.ru', 	Name = 'Jeans');
        insert rqst;
        
        System.Test.startTest();
        
        RequestActs.addInfoToRequest();

        System.Test.stopTest();
        
        System.assertEquals(rqst.Product__c, prdct.id);
        System.assertEquals(rqst.Customer__c, cstmr.id);
    }
    
     @isTest
    private static void testdeleteReadyRequests(){
        Customer__c cstmr = new Customer__c(Name = 'Paul', Email__c = 'pauloosha@mail.ru');
        insert cstmr;
        Product2 prdct = new Product2(Name = 'Jeans');
        insert prdct;
        Request__c rqst = new Request__c(Product__c = prdct.id, Customer__c = cstmr.id, Customer_email__c = 'pauloosha@mail.ru', 	Name = 'Jeans', To_sew__c = true);
        insert rqst;
        Request__c rqst2 = new Request__c(Product__c = prdct.id, Customer__c = cstmr.id, Customer_email__c = 'pauloosha@mail.ru', 	Name = 'Jeans', To_sew__c = false);
        insert rqst2;
        
        System.Test.startTest();
        
        RequestActs.deleteReadyRequests();

        System.Test.stopTest();
        
        List<Request__c> rstList = [select Name from Request__c];
        System.assertEquals(1, rstList.size());
    }
    
    @isTest
    private static void testtoSewRequest(){
        Product2 tshirt = new Product2(Name = 'T-Shirt');
        insert tshirt;
        Customer__c cstmr = new Customer__c(Name = 'Paul', Email__c = 'pauloosha@mail.ru');
        insert cstmr;
        Request__c rqst = new Request__c(Product__c = tshirt.id, Customer__c = cstmr.id, To_sew__c = false, Name = tshirt.name, 	Customer_email__c = cstmr.Email__c);
        insert rqst;
        Map<Id, SObject> oldReqList = new Map<Id, SObject>();
        Map<Id, SObject> newReqList = new Map<Id, SObject>();
        oldReqList.put(rqst.Id, rqst);
        Request__c rqst2 = new Request__c(Product__c = tshirt.id, Customer__c = cstmr.id, To_sew__c = true, Name = tshirt.name, 	Customer_email__c = cstmr.Email__c);
        insert rqst2;
        newReqList.put(rqst.Id, rqst2);
        Material__c mtr = new Material__c(Name = 'Cotton', Quantity_in_stock__c = 1000, 	Provider_email__c = 'pauloosha@mail.ru');
        insert mtr;
        Composition__c cmpstion = new Composition__c(Material__c = mtr.id, Quantity_of_material_in_product__c = 3, Product__c = tshirt.id);
        insert cmpstion;
        System.Test.startTest();
        
        RequestActs.toSewRequest(oldReqList, newReqList);

        System.Test.stopTest();
    }
}