trigger AccountToUpdate on Account (after Update) {
	if(trigger.isUpdate&&trigger.isafter)
    {
        Map<id,account> account=new Map<id,account>();
        if(!trigger.new.isempty())
        {
            for(account accobj:trigger.new)
            {
                if(accobj.phone!=trigger.oldmap.get(accobj.id).phone)
                {
                    account.put(accobj.Id,accobj);
                }
            }
            list<contact> con = [select id,name,phone,AccountId from Contact where AccountId in:account.keyset()];
            list<contact> contacttoUpdate=new list<contact>();
            for(contact c:con)
            {
                c.phone=account.get(c.accountid).phone;
            	contacttoUpdate.add(c);
            }
            if(contacttoupdate!=null)
            {
                try
                {
                    update contacttoupdate;
                }
                catch(Exception e)
                {
                    System.debug('exception is'+e.getMessage());
                }
            }
        }
    }
}