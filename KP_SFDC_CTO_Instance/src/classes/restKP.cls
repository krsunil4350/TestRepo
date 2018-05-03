public class restKP {
    @AuraEnabled
    public static void kpResp() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setClientCertificateName('surajbabu');
        request.setEndpoint('https://apiservice-bus-dev.kp.org:2005/service/ptnt_care/ptnt_care_sup/KPHC/KPHCLSPApp/v1');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
        response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
    }
}