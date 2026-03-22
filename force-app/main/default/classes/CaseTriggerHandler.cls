public class CaseTriggerHandler {
    public static set<id> parentCaseIdsToUpdate;
    public static list<case> parentCaseToUpdate;
	Public static void afterInsertHandler(list<case> cases)
    {/*todo:get parent and update total_resolution_days__c*/
        parentCaseIdsToUpdate =new set<Id>();
        for(case cas:cases)
        {
            if(cas.resolution_days__c!=null)
            {/*todo: fetch the parent case id*/
                parentCaseIdsToUpdate.add(cas.parent_case__c);
            }

        }
        
    }
    Public static void afterUpdateHandler(list<case> cases,map<id,case> oldcases)
    {/*todo:get parents of both versions and update total_resolution_days__c*/
        parentCaseIdsToUpdate =new set<Id>();
        for(case cas:cases){
            case oldcasever=oldcases.get(cas.id);
            if(cas.resolution_days__c!=oldcasever.resolution_days__c)
            {
                if(cas.parent_case__c!=null)
                {
					parentCaseIdsToUpdate.add(cas.parent_case__c);                    
                }
            }
            if(cas.parent_case__c!=oldcasever.parent_case__c)
             {
                 if(oldcasever.parent_case__c!=null){
                     parentCaseIdsToUpdate.add(cas.parent_case__c);
                 }
                      if(oldcasever.parent_case__c!=null){
                 	parentCaseIdsToUpdate.add(oldcasever.parent_case__c);
                 }
             }
            
        }CaseTriggerHelper.updateTotalResolutionDaysOnParentCases(parentCaseIdsToUpdate);
    }
    Public static void afterDeleteHandler(list<case> cases)
    {/*todo:get parent and update total_resolution_days__c*/
        parentCaseIdsToUpdate =new set<Id>();
        for(case cas:cases)
        {
            if(cas.resolution_days__c!=null)
            {/*todo: fetch the parent case id*/
                parentCaseIdsToUpdate.add(cas.parent_case__c);
            }
            CaseTriggerHelper.updateTotalResolutionDaysOnParentCases(parentCaseIdsToUpdate);
        }
        }
    Public static void afterUndeleteHandler(list<case> cases)
    {/*todo:get parent and update total_resolution_days__c*/
        parentCaseIdsToUpdate =new set<Id>();
        for(case cas:cases)
        {
            if(cas.resolution_days__c!=null)
            {/*todo: fetch the parent case id*/
                parentCaseIdsToUpdate.add(cas.parent_case__c);
            }
            CaseTriggerHelper.updateTotalResolutionDaysOnParentCases(parentCaseIdsToUpdate);
        }
    }
}