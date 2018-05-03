public class FHIRPatientDataController {
  @AuraEnabled
  public static List<FHIR_Data__c> getFhirPatientData() {
    return [SELECT Id, Allergy_Intolerance__c, Drug__c, Reaction__c, Severity__c, EPIC_MRN__c, Name, Active__c, Address__c, Care_Provider__c, City__c, Country__c, Deceased__c, DOB__c, Email__c, Marital_Status__c, Phone__c, Postal_Code__c, Preferred_Language__c, Resource_Type__c, State__c, Work_Phone__c
    FROM FHIR_Data__c ORDER BY createdDate ASC];
  }
}