public class CopyAddressClass {
    public void newmethod (List<Account> newList1, Map<Id,Account> oldMap){

        list<Address__c> pdlist = new list<Address__c>();
        Map<id, account> mapacc = new  Map<id, account>();
        for(account acc : newlist1 )
        {
            if(acc.ShippingStreet==acc.BillingStreet &&
                acc.ShippingCity==acc.BillingCity &&
                acc.ShippingState==acc.BillingState &&
                acc.ShippingPostalCode==acc.BillingPostalCode &&
                acc.ShippingCountry==acc.BillingCountry)
            {
                mapacc.put(acc.id,acc);
            }
        }
        for(Address__c pd :[select id,AccountId__c from Address__c where AccountId__c In:mapacc.keyset()])
        {
            if(mapacc.containsKey(pd.AccountId__c)){
                pd.Primary__c=true;
                pdlist.add(pd);
            }
        }
         try
        { 
           if(!pdlist.isEmpty())
           {
                update pdlist;
           }
        }
        Catch(Exception e)
        {
            system.debug('exception'+e);
        }
    }
 public void uncheck (List<Account> newList1, Map<Id,Account> oldMap){
        list<Address__c> pdlist = new list<Address__c>();
        Map<id, account> mapacc = new  Map<id, account>();
        for(account acc : newlist1 )
        {
            if(acc.ShippingStreet !=acc.BillingStreet ||
                acc.ShippingCity !=acc.BillingCity ||
                acc.ShippingState !=acc.BillingState ||
                acc.ShippingPostalCode !=acc.BillingPostalCode ||
                acc.ShippingCountry !=acc.BillingCountry)
            {
                mapacc.put(acc.id,acc);
            }
        }
        for(Address__c pd :[select id,AccountId__c from Address__c where AccountId__c In:mapacc.keyset()])
        {
            if(mapacc.containsKey(pd.AccountId__c)){
                pd.Primary__c=false;
                pdlist.add(pd);

            }
        }
         try
        {
           if(!pdlist.isEmpty())
           {
                update pdlist;
           }
        }
        Catch(Exception e)
        {
            system.debug('exception'+e);
        }
}
}