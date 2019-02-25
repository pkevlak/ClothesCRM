public class MaterialDelivery {
    public static Map<Id, decimal> getMapOfMaterials(){
        List<Composition__c> cmpsList = [select Product__c, Material__c, Quantity_of_material_in_product__c from Composition__c];
        List<Request__c> rqstList = [select Customer__c, Product__c, Customer_email__c, Name from Request__c];
        decimal sum = 0;
        Map<Id, decimal> matMap = new Map<Id, decimal>();
        for(Request__c rqst : rqstList){
            for(Composition__c cmps : cmpsList){
                if(cmps.Product__c == rqst.Product__c ){
                    if(matMap.containsKey(cmps.Material__c)){
                        for(Id smid : matMap.keySet()){
                            if(smid == cmps.Material__c)
                            {
                            sum = matMap.get(smid);
                            sum += cmps.Quantity_of_material_in_product__c;
                            matmap.remove(smid);
                            matmap.put(smid, sum);
                            }
                        }
                    }
                    else{
                        matmap.put(cmps.Material__c, cmps.Quantity_of_material_in_product__c);
                    }
                }
            }
        }
        return matmap;
    }
    
    public static boolean checkMaterialQuantity(){
        boolean isEnough = true;
        Map<Id, decimal> matMap = getMapOfMaterials();
        List<Material__c> mtrList = [select name, Quantity_in_stock__c, Provider_email__c from Material__c];
        for(Id anid : matMap.keySet()){
            for(Material__c mtr : mtrList){
                if(anid == mtr.id){
                    if(matmap.get(anid)>mtr.Quantity_in_stock__c){
                        isEnough = false;
                    }
                }
            }
        }
        return isEnough;
    }
    
    public static boolean checkMaterialQuantity(Request__c rqst){
        boolean isEnough = true;
        /*Map<Id, decimal> matMap = getMapOfMaterials();
        List<Composition__c> cmpsList = [select Product__c, Material__c, Quantity_of_material_in_product__c from Composition__c where product__c = :rqst.Product__c];
        List<Id> mtrList2 = new List<Id>();
        for(Composition__c cmps : cmpsList){
            Id mtr = cmps.Material__c;
            mtrList2.add(mtr);
        }
        List<Material__c> mtrList = [select name, Quantity_in_stock__c, Provider_email__c from Material__c where id in :mtrList2];
        System.debug(mtrList);
        for(Id anid : matMap.keySet()){
            for(Material__c mtr : mtrList){
                if(anid == mtr.id){
                    if(matmap.get(anid)>mtr.Quantity_in_stock__c){
                        isEnough = false;
                    }
                }
            }
        }*/
        Map<Id, decimal> matMap = getMapOfMaterials();
        List<Composition__c> cmpsList = [select Product__c, Material__c, Quantity_of_material_in_product__c from Composition__c where product__c = :rqst.Product__c];
        List<Material__c> mtrList = [select name, Quantity_in_stock__c, Provider_email__c from Material__c];
        for(Composition__c cmps : cmpsList){
            for(Material__c mtr : mtrList){
                if(cmps.Material__c == mtr.id){
                    if(cmps.Quantity_of_material_in_product__c>mtr.Quantity_in_stock__c){
                        isEnough = false;
                    }
                }
            }
        }
        return isEnough;
    }
    
    public static void orderMaterial(){
        Map<Id, decimal> matMap = getMapOfMaterials();
        List<Material__c> mtrList = [select name, Quantity_in_stock__c, Provider_email__c from Material__c];
        for(Id anid : matMap.keySet()){
            for(Material__c mtr : mtrList){
                if(anid == mtr.id){
                    if(matmap.get(anid)>mtr.Quantity_in_stock__c){
                        decimal howmore = matmap.get(anid) - mtr.Quantity_in_stock__c;
                        sendEmailAboutMaterial(mtr, howmore);
                    }
            }
            }
        }
    }
    
    private static void sendEmailAboutMaterial(Material__c mtr, decimal howmore){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                        List<String> toAddresses = new List<String>();
                        toAddresses.add(mtr.Provider_email__c);
                        List<String> ccAddresses = new List<String>();
                        ccAddresses.add('kevlak@clothescrm.org');
                        String text = 'Need ' + mtr.name + ' ' + howmore + ' more';
                        mail.setToAddresses(toAddresses);
                        mail.setsubject('Clothes materials request');
                        mail.setCcAddresses(ccAddresses);
                        mail.setPlainTextBody(text);
                        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                        System.debug('Mail has been sent');
    }
}