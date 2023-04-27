trigger countNoOfContact on Contact (before insert,after insert, after update, after undelete, after delete) {
//"Count no of contact" I am using Trigger

     List<Contact> modContacts = Trigger.isDelete ? Trigger.old:Trigger.new;
        
		Set<Id> accId=new Set<Id>();        
        for(Contact c: modContacts){
            if(c.AccountId!=null){
               accId.add(c.AccountId);  // fetching AccountId from Contact 
            }
            
        }
        
        //Aggregate Query to get count of contact
        List<Account> accUpdate=new List<Account>();
        
        for(AggregateResult agg:[Select AccountId ids,count(id) totalCount from Contact where AccountId in:accId group by AccountId]){
            Account a=new Account();
            a.Id= (Id) agg.get('ids');
            a.Number_of_Contacts__c= (Integer)agg.get('totalCount');
            System.debug('num of contact'+a.Number_of_Contacts__c);
            accUpdate.add(a);
        }
        
        Update accUpdate;
        
    
    
    }