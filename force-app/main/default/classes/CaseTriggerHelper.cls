public class CaseTriggerHelper {
    public static list<case> parentCaseToUpdate;
	public static void updateTotalResolutionDaysOnParentCases(set<id> parentCaseIdsToUpdate)
    {
     	if(parentCaseIdsToUpdate.size()>0)
            {/*todo:aggregrate the resolution days of child records to parent case*/
                parentCaseToUpdate =new list<case>();
                AggregateResult[] caseswithresoultiondays
 				 = [SELECT Parent_case__c,SUM(total_resolution_days__c)totaldays FROM case where Parent_case__c in:parentCaseIdsToUpdate group by  Parent_case__c];
				for (AggregateResult ar : caseswithresoultiondays) 
                {/*todo:list of parent cases to update*/
    					Id parentid=(Id)ar.get('Parent_case__c');
                    Decimal totalresoultiondays=(Decimal)ar.get('totaldays');
                    parentCaseToUpdate.add(new case(Id=Parentid,total_resolution_days__c=totalresoultiondays));
					}
              if(parentCaseToUpdate.size()>0)
              {
                  update parentCaseToUpdate;
              }
            }   
    }
}