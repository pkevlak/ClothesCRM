@isTest
public class RequestTriggerTest {
    
    @isTest static void TestInsertRequest() {
    
    Request__c rqst = new Request__c(Name = 'Test', Product__c = '01t0o000007rEZI', Customer_email__c = 'pauloosha@mail.ru');
    Test.startTest();
    Database.insert(rqst);
    Test.stopTest();
    }
}