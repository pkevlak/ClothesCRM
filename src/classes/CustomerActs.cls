public class CustomerActs {
    public static void createCustomerIfDoesntExist(List<Request__c> reqlist){
        List<Customer__c> nwcstmrs = new List<Customer__c>();
        for(Request__c req : reqlist)
        {
            if(checkCustomer(reqlist) == false){
                String cstname = req.Customer_email__c.substring(0, req.Customer_email__c.indexOf('@'));
                Customer__c nwcust = new Customer__c(Name = cstname, Email__c = req.Customer_email__c);
                nwcust.OwnerId = '0050o00000UhlS8';
                nwcstmrs.add(nwcust);
            }
        }
        insert nwcstmrs;
    }
    
    private static boolean checkCustomer(List<Request__c> reqlist){
        Boolean isExist = false;
        List<Customer__c> cust = [select Id, Email__C from Customer__c];
        integer samecstmrs = 0;
        for(Request__c req : reqlist)
        {
            for(Customer__c cstmr : cust){
                if(req.Customer_email__c == cstmr.Email__c){
                    samecstmrs++;
                }
            }
        }
        if(samecstmrs > 0){
            isExist = true;
        }
        return isExist;
    }
    
    public static void sendEmailToCustomer(Request__c rqst){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                        List<String> toAddresses = new List<String>();
                        toAddresses.add(rqst.Customer_email__c);
                        List<String> ccAddresses = new List<String>();
                        ccAddresses.add('kevlak@clothescrm.org');
                        String text = 'Your ' + rqst.Name + ' is sewn';
                        mail.setToAddresses(toAddresses);
                        mail.setsubject('The request for clothes is ready');
                        mail.setCcAddresses(ccAddresses);
                        mail.setPlainTextBody(text);
                        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                        System.debug('Mail has been sent');
    }
}