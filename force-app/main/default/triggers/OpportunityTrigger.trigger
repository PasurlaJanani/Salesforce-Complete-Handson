/*Problem statement: Whenever the Opportunity stage is changed to CLosed Won ,Update the Next step with 'Onboard a Contract'
 * and perform the tasks to schedule call,send email,send welcome message*/
trigger OpportunityTrigger on Opportunity (before insert,before Update,after insert,after update) 
{
		 Switch on Trigger.OperationType
         {
             When BEFORE_INSERT,BEFORE_UPDATE{
                 for (Opportunity oppor:Trigger.new)
                 {
                     if(oppor.StageName=='Closed Won')
                     {
                          oppor.NextStep='Onboard a Contract';
                     }
                    
                 }
             }
             When AFTER_INSERT,AFTER_UPDATE{
                 List<Task> tasks=new list<Task>();
                 for (Opportunity oppor:Trigger.new)
                 {
                     if(oppor.StageName=='Closed Won')
                     {
                     Task scheduleCall=new Task();
                     scheduleCall.Whatid=Oppor.Id;
                     ScheduleCall.Subject='schedulecall';
                     tasks.add(scheduleCall);
                     
                     Task welcomeMessage=new Task();
                     welcomeMessage.Whatid=Oppor.Id;
                     welcomeMessage.Subject='welcomeMessage';
                     tasks.add(welcomeMessage);
                     
                     Task EmailMessage=new Task();
                     EmailMessage.Whatid = Oppor.Id;
                     EmailMessage.Subject='EmailMessage';
                     tasks.add(EmailMessage);
                 }
                 } 
                 insert tasks;
             }
         }
}