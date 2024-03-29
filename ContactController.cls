public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accId){
        try {
            return[
                SELECT AccountId, Id, FirstName, LastName
                FROM Contact
                WHERE AccountId =: accId
                WITH SECURITY_ENFORCED
                system.debug('My name is Hyder');
                system.debug('I am Hyder');
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}