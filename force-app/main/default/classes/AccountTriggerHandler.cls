public class AccountTriggerHandler {
    List<account> acc= new list<account>();
    Public Static boolean hasafterupdateexecuted=false;
    Public void afterUpdateHandler(list<account> updateaccount)
    {
        for(account acc1:updateaccount)
            {
                Account acc2= new Account(id=acc1.id);
				acc2.Last_After_Update_Execution_Time__c= Datetime.now();
                acc.add(acc2);
            }
   		if(acc.size()>0)
        {
            update acc;
        }
    }
}