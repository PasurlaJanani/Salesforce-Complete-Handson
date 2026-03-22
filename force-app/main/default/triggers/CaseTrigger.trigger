/*Problem statement: Our company salesforce system manages customer support cases.Each case can have multiple realted child records
 * the company wants to implement a feature that automatically calculates and updates the total resolution days for parent cases
 * based on the resolution days of the related child cases.Additionally,we want to ensure that any changes made to child cases are
 * accurately reflected in the parent case resolution time.
 * 
 Example:Parent case(p-001) has 3 child cases:
Child case (c-001) has resolution_days__c=5
Child case (c-002) has resolution days=3
Child case (c-003) has resolution days=2

if a fouth child case (c-004) is added with resolution days=4 the parent case total_resolution_days__c should update to 14

Questions to ask:
1.How many levels deep this hirerachy can go-1
2.can the resolution days be updated manually-No it is read only field
3.When will the resolution days be updated-when case status changes to closed-resolved
4.Can a case be created with the closed-resolved status-Yes
 *
*/
trigger CaseTrigger on Case (after insert,after update,after delete,after undelete) {
    Switch on Trigger.operationType{
        when AFTER_INSERT{
            CaseTriggerHandler.afterInsertHandler(Trigger.new);
        }
        when AFTER_UPDATE{
            CaseTriggerHandler.afterUpdateHandler(Trigger.new,trigger.Oldmap);
        }
        when AFTER_DELETE{
            CaseTriggerHandler.afterDeleteHandler(Trigger.old);
        }
        when AFTER_UNDELETE{
            CaseTriggerHandler.afterUndeleteHandler(Trigger.new);
        }
       
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}