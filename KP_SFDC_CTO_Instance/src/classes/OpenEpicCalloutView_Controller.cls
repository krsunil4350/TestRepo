public with sharing class OpenEpicCalloutView_Controller {
	
	public String requestEndpoint {get;set;}
	public String requestMethod {get;set;}
	public String requestBody {get;set;}
	public String responseStatus {get;set;}
	public Integer responseStatusCode {get;set;}
	public String responseBody {get;set;}
	public OpenEpicPatientDemographicAPI.responseResource response {get;set;}
	public List<OpenEpicPatientDemographicAPI.questionResource> deserializedQuestions {get;set;}
	
	public OpenEpicCalloutView_Controller(){
		requestEndpoint = OpenEpicPatientDemographicAPI.compileEndpoint(
            'questions/unanswered',
			'salesforce',
			1,
			50,
			system.today().addDays(-1),
			system.today(),
			'desc',
			system.today().addDays(-1),
			system.today(),
			'activity',
			''
		);
	}

	public void callout(){
		httpResponse res = OpenEpicPatientDemographicAPI.callout(requestMethod, requestEndpoint, requestBody);
		responseStatus = res.getStatus();
		responseStatusCode = res.getStatusCode();
		responseBody = res.getBody();
	}
	
	public void deserializeQuestions(){
		if ( string.isNotBlank(responseBody) ){
			response = (OpenEpicPatientDemographicAPI.responseResource)JSON.deserialize(responseBody,OpenEpicPatientDemographicAPI.responseResource.class);
			deserializedQuestions = response.items;
		}	
	}
	
	public List<SelectOption> getMethodOptions(){
		List<SelectOption> options = new List<SelectOption>();
		options.add(new SelectOption('GET','GET'));
		options.add(new SelectOption('POST','GET'));
		options.add(new SelectOption('PUT','GET'));
		options.add(new SelectOption('DELETE','GET'));
		options.add(new SelectOption('HEAD','GET'));
		return options;
	}
}