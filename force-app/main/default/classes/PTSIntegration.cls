public with sharing class PTSIntegration {
    @future(callout=true)
    public static void getRequest() {
        Http http=new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customerList.php?token=Buuch47EGaak3YCVyawwJYjWT2kOarZTNI00w9rNkR0krD7gWphoCxufiKeYSoCO');
        request.setMethod('GET');
        HttpResponse response= http.send(request);
        system.debug(response.getBody());
        system.debug(response.getStatusCode());
        List<ParseForIntegration> customerList=ParseForIntegration.parse(response.getBody());
		system.debug(customerList);
        }
}