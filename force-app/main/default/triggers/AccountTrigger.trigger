/*Problem Statement:Whenever an After update trigger is executed on Account Record,
 * Update the field named last after update execution time(Last_After_Update_Execution_Time__c) on account with currenttime
  */
trigger AccountTrigger on Account (after update) {
    list<Account> acc=new list<account>();
    Switch on Trigger.OperationType{
        when AFTER_UPDATE{
            if(!AccountTriggerHandler.hasafterupdateexecuted)
            {
                AccountTriggerHandler.hasafterupdateexecuted=True;
                new AccountTriggerHandler().afterUpdateHandler(trigger.new);
            }
            
        }
    }

}