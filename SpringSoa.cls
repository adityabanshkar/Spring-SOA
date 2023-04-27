public class SpringSoa {

    public static void calloutSimple(){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        request.setMethod('GET');
        
        //Collecting respose and making call to apiend point
        HttpResponse response= http.send(request);
        
        //Displaying result
        if(response.getStatusCode()==200)
            System.debug('Result:'+response);
       
        
    }
}