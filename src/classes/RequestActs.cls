public class RequestActs {
    public static void addInfoToRequest(){
        List<Request__c> clonerqst = new List<Request__c>();
        List<Request__c> clone = [select Customer__c, Product__c, Customer_email__c, Name from Request__c];
            for(Request__c rqst : clone)
            {
                addCustomerInfo(rqst);
                addProductInfo(rqst);
                rqst.OwnerId = '0050o00000UhlS8';
                clonerqst.add(rqst);
            }
        update clonerqst;
    }
    
    public static void toSewRequest(Map<Id, SObject> oldReqList, Map<Id, SObject> newReqList){
        List<Request__c> forUpd = new List<Request__c>();
        List<Request__c> readyReq = new  List<Request__c>();
        List<Material__c> mtrForUpd = new List<Material__c>();
        List<Composition__c> cmpsList = [select Product__c, Material__c, Quantity_of_material_in_product__c from Composition__c];
        List<Material__c> mtrList = [select name, Quantity_in_stock__c, Provider_email__c from Material__c];
        for(Id reqid :  newReqList.keySet()){
            Request__c oldrqst = (Request__c)oldReqList.get(reqId);
            Request__c nwrqst = (Request__c)newReqList.get(reqId);
            if( oldrqst.To_sew__c != nwrqst.To_sew__c)
            {
                if(MaterialDelivery.checkMaterialQuantity(oldrqst) == false){
                    /*MaterialDelivery.orderMaterial();
                    nwrqst.To_sew__c = false;*/
                    nwrqst.addError('There is not enough material.');
                }
                else{
                    for(Composition__c cmps : cmpsList){
                        if(cmps.Product__c == nwrqst.Product__c){
                            for(Material__c mtr: mtrList){
                                if(mtr.id == cmps.Material__c){
                                    Material__c nwmtr = mtr;
                                    nwmtr.Quantity_in_stock__c -= cmps.Quantity_of_material_in_product__c;
                                    mtrForUpd.add(nwmtr);
                                }
                            }
                        }
                    }
                    CustomerActs.sendEmailToCustomer(nwrqst);
                }
            }
        }
        update mtrForUpd;
    }
    
    public static void deleteReadyRequests(){
        List<Request__c> readyReq = [select To_sew__c from Request__c where To_sew__c = true];
        try{
        delete readyReq;
        }
        catch(Exception ex){
            System.debug('Cant delete request');
        }
    }
    
    public static boolean checkReadyRequests(Map<Id, SObject> oldReqList, Map<Id, SObject> newReqList){
        boolean isexist = false;
        for(Id reqid :  oldReqList.keySet()){
            Request__c oldrqst = (Request__c)oldReqList.get(reqId);
            Request__c nwrqst = (Request__c)newReqList.get(reqId);
            if( oldrqst.To_sew__c != nwrqst.To_sew__c && nwrqst.To_sew__c == true)
            {
                isexist = true;
            }
    }
        return isexist;
    }
    
    private static void addCustomerInfo(Request__c rqst){
        List<Customer__c> cust = [select Id, Email__c from Customer__c];
        for(Customer__c cst : cust){
                if(rqst.Customer_email__c == cst.Email__c){
                    rqst.Customer__c = cst.id;
                }
        }
    }
    
    private static void addProductInfo(Request__c rqst){
        List<Product2> prdctlist = [select id, name from Product2];
        for(Product2 prdct : prdctlist){
                if(rqst.Name == Prdct.name){
                    rqst.Product__c = prdct.Id;
                }
            }
    }
}