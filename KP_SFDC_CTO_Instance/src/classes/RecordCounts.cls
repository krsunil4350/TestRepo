public class RecordCounts {
    @AuraEnabled
    public Integer numAccounts {get; set;}
    
    @AuraEnabled
    public Integer numContacts {get; set;}
    
    @AuraEnabled
    public Integer numOpportunities {get; set;}
    
    @AuraEnabled
    public static RecordCounts GetRecordCounts()
    {
        RecordCounts result=new RecordCounts();
        result.numAccounts=[select count() from Account];
        result.numContacts=[select count() from Contact];
        result.numOpportunities=[select count() from Opportunity];
        
        return result;
    }
}