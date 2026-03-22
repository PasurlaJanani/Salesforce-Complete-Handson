trigger AccountHasContact on Contact (after insert,before update) {
    Map<id,Account> accountMap=new Map<id,Account>();
    if(trigger.isInsert&&trigger.isAfter)
    {
        for(contact con:Trigger.New)
        {
            if(con.AccountId!=null){
                accountMap.put(con.AccountId,null);
            }
        }
        if(!accountMap.isEmpty())
        {
            for(Account acc:[select id,Contact_Created__c from Account where id in :AccountMap.keyset()])
            {
                acc.Contact_Created__c=true;
                AccountMap.put(acc.id,acc);
            }
        }
        update accountMap.values();
    }
    
}