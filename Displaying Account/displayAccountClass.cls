public with sharing class displayAccountClass {
    
	@AuraEnabled(cacheable=true)
    Public static List<Account> getAccount(){
        return [Select Id , Name ,CreatedDate from Account Order by CreatedDate Desc limit 10];
    
    }
}