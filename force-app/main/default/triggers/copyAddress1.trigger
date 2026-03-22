trigger copyAddress1 on Account (before insert,before update,after insert,after update) {
    CopyAddressClass help1=new CopyAddressClass();
    if(trigger.isafter&&trigger.isinsert)
    {
		help1.newmethod(trigger.new,trigger.oldMap);
    }
    if(trigger.isafter&&trigger.isupdate)
    {
		help1.uncheck(trigger.new,trigger.oldMap);
    }

}