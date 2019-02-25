public abstract class TriggerHandler {
  
    public void run(){
    if(Trigger.isInsert && Trigger.isBefore){
        onBeforeInsert();
    }
    if(Trigger.isInsert && Trigger.isAfter){
        onAfterInsert();
    }
    if(Trigger.isUpdate && Trigger.isBefore){
        onBeforeUpdate();
    }
    if(Trigger.isUpdate && Trigger.isAfter){
        onAfterUpdate();
    }
    }
    
    public virtual void onBeforeInsert(){
    }
    
    public virtual void onAfterInsert(){    
    }
    
    public virtual void onBeforeUpdate(){  
    }
    
    public virtual void onAfterUpdate(){
    }
}