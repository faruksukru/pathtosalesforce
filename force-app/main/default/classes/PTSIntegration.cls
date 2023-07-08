public with sharing class PTSIntegration {
    public static void getRequest() {
        Http http=new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customerList.php?token=KPDuUtXKtoBLVu7bJXFGFKKq5WX2wbhfkEdhJePKiShPSzup6CujSvBuODiNc506');
        request.setMethod('GET');
        HttpResponse response= http.send(request);
        system.debug(response.getBody());
        system.debug(response.getStatusCode());

        }
}