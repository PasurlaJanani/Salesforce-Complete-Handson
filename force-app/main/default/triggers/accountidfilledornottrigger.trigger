trigger accountidfilledornottrigger on Address__c (before insert,before update) {
    if(trigger.isBefore && trigger.isInsert)
    {
        for(Address__c addr : trigger.new)
        {
            if(addr.AccountId__c!=null)
            {
                addr.Is_AccountId_filled__c=True;
            }
            else
            {
                addr.Is_AccountId_filled__c=False;
            }
            
        }
    }
if(trigger.isBefore && trigger.isUpdate)
    {
        for(Address__c addr : trigger.new)
        {
            if(addr.AccountId__c!=null)
            {
                addr.Is_AccountId_filled__c=True;
            }
            else
            {
                addr.Is_AccountId_filled__c=False;
            }
            
        }
    }
}