@isTest
public class MaterialDeliveryTest {

    @isTest
    private static void testgetMapOfMaterials(){
        Product2 tshirt = new Product2(Name = 'T-Shirt');
        insert tshirt;
        Customer__c cstmr = new Customer__c(Name = 'Paul');
        insert cstmr;
        Request__c rqst = new Request__c(Product__c = tshirt.id, Customer__c = cstmr.id);
        insert rqst;
        Material__c mtr = new Material__c(Name = 'Cotton', 	Provider_email__c = 'pauloosha@mail.ru');
        insert mtr;
        Composition__c cmpstion = new Composition__c(Material__c = mtr.id, Quantity_of_material_in_product__c = 3, Product__c = tshirt.id);
        insert cmpstion;
        decimal sum = 0;
        List<Material__c> mtrList = [select Id from Material__c];
        List<Composition__c> cmpsList = [select Product__c, Material__c, Quantity_of_material_in_product__c from Composition__c];
        for(Composition__c cmps : cmpsList){
            if(cmps.Material__c == mtrList[0].id){
                sum += cmps.Quantity_of_material_in_product__c;
            }
        }
        System.Test.startTest();
        
        Map<Id, decimal> mtrmap = MaterialDelivery.getMapOfMaterials();
        System.debug(mtrmap);
        System.Test.stopTest();
        
        System.debug(mtrmap);
        System.assertEquals(mtrmap.get(mtrList[0].id), sum);
    }
    
    @isTest
    private static void testcheckMaterialQuantity(){
        Product2 tshirt = new Product2(Name = 'T-Shirt');
        insert tshirt;
        Customer__c cstmr = new Customer__c(Name = 'Paul');
        insert cstmr;
        Request__c rqst = new Request__c(Product__c = tshirt.id, Customer__c = cstmr.id);
        insert rqst;
        Material__c mtr = new Material__c(Name = 'Cotton', Quantity_in_stock__c = 5, Provider_email__c = 'pauloosha@mail.ru');
        insert mtr;
        Composition__c cmpstion = new Composition__c(Material__c = mtr.id, Quantity_of_material_in_product__c = 3, Product__c = tshirt.id);
        insert cmpstion;
        System.Test.startTest();
        
        boolean bl = MaterialDelivery.checkMaterialQuantity();

        System.Test.stopTest();
        
        System.assertEquals(true, bl);
    }
    
    @isTest
    private static void testorderMaterial(){
        Product2 tshirt = new Product2(Name = 'T-Shirt');
        insert tshirt;
        Customer__c cstmr = new Customer__c(Name = 'Paul');
        insert cstmr;
        Request__c rqst = new Request__c(Product__c = tshirt.id, Customer__c = cstmr.id);
        insert rqst;
        Material__c mtr = new Material__c(Name = 'Cotton', Quantity_in_stock__c = 2, Provider_email__c = 'pauloosha@mail.ru');
        insert mtr;
        Composition__c cmpstion = new Composition__c(Material__c = mtr.id, Quantity_of_material_in_product__c = 3, Product__c = tshirt.id);
        insert cmpstion;
        System.Test.startTest();
        
        MaterialDelivery.orderMaterial();

        System.Test.stopTest();
    }
}