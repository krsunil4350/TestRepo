public class PhirRestController {
    @AuraEnabled
        public static String getPatientResource (String resourceType, String identifier) {
            String url = 'https://open-ic.epic.com/FHIR/api/FHIR/DSTU2/Patient/Tbt3KuCY0B5PSrJvCu2j-PlK.aiHsu2xUjUM8bWpetXoB';
            HttpRequest req = new HttpRequest();
            Http http = new Http();
            req.setMethod('GET');    
            req.setEndpoint(url);
            HTTPResponse res = http.send(req);
            return res.getBody();
        }

}