public class RequestTriggerHandler extends TriggerHandler {
    
    public override void onBeforeInsert(){
            CustomerActs.createCustomerIfDoesntExist(trigger.new);
    }
    
    public override void onAfterInsert(){
        RequestActs.addInfoToRequest();
        if(MaterialDelivery.checkMaterialQuantity() == false)
        {
            MaterialDelivery.orderMaterial();
        }
    }
    
    public override void onBeforeUpdate(){
        RequestActs.toSewRequest(Trigger.oldMap, Trigger.newMap);
    }
    
    public override void onAfterUpdate(){
        if(RequestActs.checkReadyRequests(trigger.oldmap, trigger.newmap)){
        RequestActs.deleteReadyRequests();
        }
    }
}