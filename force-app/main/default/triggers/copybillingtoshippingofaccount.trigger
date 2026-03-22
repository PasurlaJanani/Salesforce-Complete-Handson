trigger copybillingtoshippingofaccount on Account (before insert,before update) 
{
        for(Account addr : trigger.new)
        {
            if(addr.copyBillingToShipping__c==True)
            {
               addr.ShippingCity= addr.BillingCity;
                addr.ShippingCountry= addr.BillingCountry;
                addr.ShippingPostalCode=addr.BillingPostalCode;
                addr.ShippingState=addr.BillingState;
                addr.ShippingStreet=addr.BillingStreet;
            }
            else
            {
                addr.ShippingCity= null;
                addr.ShippingCountry=null;
                addr.ShippingPostalCode=null;
                addr.ShippingState=null;
                addr.ShippingStreet=null;
            }
        }
}