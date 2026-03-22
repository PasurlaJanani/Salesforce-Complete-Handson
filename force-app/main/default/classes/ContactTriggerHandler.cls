public class ContactTriggerHandler {
    
    public static void afterInsertHandler(list<contact> contacts)
    {
        set<id> accids=new set<id>();
        for(contact con: contacts)
        {
            if(con.active__c==True && con.AccountId!=null)
            {
                accids.add(con.AccountId);
            }
        }
        if(!accids.isempty())
        {
            //Query all accounts
            Map<id,Account> acc=new map<id,Account>([select id,Name from Account where id in:accids]);
            //map accountids with relatedcontacts
            Map<id,list<contact>> accounttocontactsmap= new map<id,list<contact>>();
            List<contact> c=[select id,Name,accountid from contact where accountid IN:accids];
            for(contact con:c){
                if(!accounttocontactsmap.containsKey(con.accountid)){
                    accounttocontactsmap.put(con.accountid,new list<contact>());
                }
                accountToContactsMap.get(con.AccountId).add(con);
            }
            // Update each account's Active_Contacts__c field
            List<Account> accountsToUpdate = new List<Account>();
            for( id accid:accids)
            {
                if(acc.containskey(accid))
                {
                    Account acc1= acc.get(accid);
                    list<Contact> relatedcontacts= accounttocontactsmap.get(accid);
                    acc1.Active_Contacts__c=(relatedcontacts!=null?relatedcontacts.size():0);
                    accountsToUpdate.add(acc1);
                }
            }
           update accountsToUpdate;
        }
         
    }
}