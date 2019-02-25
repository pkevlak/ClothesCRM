public class CustomController {
    public Integer tot { get; set; }
    public integer totalRecs = 0;
    public static integer LimitSize = 5;
    public integer count= 0;
    public string srch2  { get; set; }
    
    public class Good{
        public string imagec {get;set;}
        public string id {get;set;}
        public string name {get;set;}
        public decimal price {get;set;}
        public Good(string name, decimal price, string imagec, id id){
            this.name = name;
            this.price = price;
            this.imagec = imagec;
            this.id = id;
        }
    }
    
    public Good good {get;set;}
    
    public Product2 pr {get;set;}

    public CustomController() {
        tot=totalRecs = [select count() from product2];
    }
public static List<Product2> productl = new List<Product2>(); 
    public List<Good> getProducts(){
        List<Good> goodList = new List<Good>();
        productl = [Select ProductCode,Name, Image__c, Image_URL__c ,Family ,description ,(Select UnitPrice, Product2Id From PricebookEntries) From Product2 LIMIT:limitsize OFFSET:count];
        if(productl == null || productl.isEmpty())
        {
            //to do
        }
        else
        {
        for(Product2 prdct : productl){
            if(prdct.name == null || prdct.Image_URL__c == null || prdct.id == null || prdct.PricebookEntries.isEmpty())
            {
            }
            else{
            Good good = new Good(prdct.name, prdct.PricebookEntries[0].UnitPrice, prdct.Image_URL__c, prdct.id);
            goodList.add(good);
            }
        }
        }
        return goodList;
    }
    
    public PageReference Firstbtn() {
     count=0;
        return null;
    }
    
    public PageReference prvbtn() {
      count=count-limitsize;
        return null;
    }
    
    public Boolean getNxt() {
        if((count+ LimitSize) > totalRecs)
       return true;
     else
       return false;   
    }
    
    public PageReference Nxtbtn() {
 count=count+limitsize;
        return null;
    }
    
    public PageReference lstbtn() {
 count= totalrecs - math.mod(totalRecs,LimitSize);
        return null;
    }
    
    public Boolean getPrv() {
      if(count== 0)
          return true;
        else
          return false;
     
    
        }
}