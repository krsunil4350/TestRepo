public class postCalloutWithXMLParser{ 

        @AuraEnabled
        public static void makePostCallout() {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://apiservice-bus-dev.kp.org:2005/service/ptnt_care/ptnt_care_sup/KPHC/KPHCLSPApp/v1?esb-region=NCAL&esb-envlbl=dev3');
            request.setMethod('POST');
            request.setHeader('esb-urn', 'urn:kp:hcotca2');
            request.setHeader('esb-id', '110013865747');
            request.setHeader('esb-idtype', 'NCALMRN');
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Accept-Encoding','gzip,deflate');
            request.setClientCertificateName('surajbabu');
            // Set the body as a JSON object
            request.setBody('{"ServiceMetadataRequest": {"regionCode": {"code": "SCA"},"systemPropertyList": {"entry": [{"value": "110013865747","name": "MRN"},{"value": "NCALMRN","name": "MRNType"}],"systemName": "EPIC"},"requestingSystemName": "CHR"},"homeInfo":"","consumerID":"123","integrationID":"123-1234567","reqData":[{"key":"ID","value":"110013865747"},{"key":"IDType","value":"NCALMRN"},{"key":"contactIDList","value":"86220791"}]}');
            HttpResponse response = http.send(request);
            Dom.Document doc = response.getBodyDocument();

            //Retrieve the root element for this document.
            Dom.XMLNode address = doc.getRootElement();
        
            String name = address.getChildElement('name', null).getText();
            String state = address.getChildElement('state', null).getText();
            // print out specific elements
            System.debug('Name: ' + name);
            System.debug('State: ' + state);
        
            // Alternatively, loop through the child elements.
            // This prints out all the elements of the address
            for(Dom.XMLNode child : address.getChildElements()) {
                System.debug(child.getText());
            }
            /*
            return response;
            /*
            // Parse the JSON response
            if (response.getStatusCode() != 201) {
                System.debug('The status code returned was not expected: ' +
                    response.getStatusCode() + ' ' + response.getStatus());
            } else {
                System.debug(response.getBody());
            }
            return response;
            */
        }
}