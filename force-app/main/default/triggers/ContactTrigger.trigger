trigger ContactTrigger on Contact (after insert,after update,after delete,after undelete) {
    switch on Trigger.OperationType{
        when AFTER_INSERT{
            ContactTriggerHandler.afterInsertHandler(Trigger.new);
        }
    }
}