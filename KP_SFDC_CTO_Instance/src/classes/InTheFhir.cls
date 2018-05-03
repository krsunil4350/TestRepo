public class InTheFhir {
    @AuraEnabled
        public static void getPatient () {
        String url = 'https://open-ic.epic.com/FHIR/api/FHIR/DSTU2/Patient?given=Jason&family=Argonaut';
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        req.setMethod('GET');    
        req.setEndpoint(url);
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
    }
}