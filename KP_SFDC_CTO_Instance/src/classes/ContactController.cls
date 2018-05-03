public with sharing class ContactController {
@AuraEnabled
    // getContacts() returns all contacts with the selected fields
    public static List<Contact> getContacts() {
        List<Contact> contacts = 
                [SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact];
        //Add isAccessible() check
        return contacts;
    }
}