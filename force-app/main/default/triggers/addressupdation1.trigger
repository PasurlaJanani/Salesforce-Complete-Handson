trigger addressupdation1 on Account (after insert,after update) {
    List<Address__c> AddressToUpdate = new List<Address__c>();    
    for (Account acc : Trigger.new) {
        if (acc.BillingStreet != null && acc.BillingCity != null && acc.BillingState != null && acc.BillingPostalCode != null && acc.BillingCountry != null) {
            Address__c addr = new Address__c();
                addr.Street__c = acc.BillingStreet;
                addr.City__c = acc.BillingCity;
                addr.State__c = acc.BillingState;
                addr.Postal_Code__c = acc.BillingPostalCode;
                addr.Country__c = acc.BillingCountry;
            AddressToUpdate.add(addr);
        }
    }    
    if (!AddressToUpdate.isEmpty()) {
        insert AddressToUpdate; 
    }
}