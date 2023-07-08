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
        List<Contact> createContact= new List<Contact>();
        for (ParseForIntegration w:customerList){
            Contact cnt= new Contact();  
            cnt.FirstName=w.firstName;
            cnt.LastName=w.lastName;
            cnt.Email=w.Email;
            cnt.Phone=w.phone;
            createContact.add(cnt);            
        } 
        Database.insert(createContact,true);
        
    }
   // @future(callout=true)
    public static void postRequest() {
        Http http=new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://https://api.pathtosalesforce.com/customer.php?token=Buuch47EGaak3YCVyawwJYjWT2kOarZTNI00w9rNkR0krD7gWphoCxufiKeYSoCO');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');  
        List<Contact> createContacts = [Select id, firstName, lastName, email, phone From Contact Where firstName Like'%faruk%'];  
       // List<IntegrationRequest> req = new List<IntegrationRequest>();
       IntegrationRequest req = new IntegrationRequest();
            req.firstName= createContacts[0].FirstName;
            req.lastName= createContacts[0].LastName;
            req.email= createContacts[0].Email;
            req.phone= createContacts[0].Phone; 
        /*for(Integer i=0;i<1;i++){
            req[i].firstName= createContacts[i].FirstName;
            req[i].lastName= createContacts[i].LastName;
            req[i].email= createContacts[i].Email;
            req[i].phone= createContacts[i].Phone;    
        }*/
        request.setBody(JSON.serialize(req)); 
        HttpResponse response= http.send(request);
        system.debug(response.getBody());
        system.debug(response.getStatusCode());
 
    }
}