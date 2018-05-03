public class KPPatientDataController {
  @AuraEnabled
  public static List<Patient_Data__c> getPatientData() {
    return [SELECT Name, Address_2__c, Allergy_Intolerance__c, Drug__c, Reaction__c, Severity__c, Language_Spoken__c, Address__c, Appointment_Department__c, City__c, Phone_1__c, Phone_2__c, CID__c, Date_of_Birth__c, CSN__c, Race__c, Sex__c, MRN__c, ZIP__c, State__c, Provider_Name__c, Provider_Title__c, Specialty__c, UCI__c
    FROM Patient_Data__c ORDER BY createdDate ASC];
  }
}