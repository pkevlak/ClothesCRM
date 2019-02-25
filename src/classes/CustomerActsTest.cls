@isTest
public class CustomerActsTest {

    @isTest
    private static void testcreateCustomerIfDoesntExist(){
        List<Request__c> rqstList = new List<Request__c>();
        Request__c rqst = new Request__c(Product__c = '01t0o000007rEZI', Customer_email__c = 'pauloosha@mail.ru');
        rqstList.add(rqst);
        Request__c rqst2 = new Request__c(Product__c = '01t0o000007rEZI', Customer_email__c = 'qorte@mail.ru');
        rqstList.add(rqst2);
        System.Test.startTest();
        
        CustomerActs.createCustomerIfDoesntExist(rqstList);
        
        System.Test.stopTest();
        
        List<Customer__c> cstmrList2 = [select Name, Email__c from Customer__c ];
    }
    
    @isTest
    private static void testsendEmailToCustomer(){
        Request__c rqst = new Request__c(Product__c = '01t0o000007rEZI', Customer_email__c = 'pauloosha@mail.ru', Name = 'Jeans');
         System.Test.startTest();
        
        CustomerActs.sendEmailToCustomer(rqst);
        
        System.Test.stopTest();
    }    
}