trigger RequestTrigger on Request__c (before insert, after insert, before update, after update) {
    
    RequestTriggerHandler handler = new RequestTriggerHandler();
    handler.run();
}