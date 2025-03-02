public class MovieApiService {
    
    public static String getImdbdata(String title, String year){
        //store the endpoint
        String endPoint = 'https://www.omdbapi.com/?apikey=954f944a&t=' + title + '&y=' + year;
        String storeAllData = '';
        try{
        //create the http instance
        Http http = new Http();
        //create the request 
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('GET');
         //create the response
        HttpResponse response = http.send(request);
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
            
            if(response.getStatusCode() == 200){
                String jsonData= response.getBody();
                MovieApiResponse responseData = (MovieApiResponse) Json.deserialize(jsonData, MovieApiResponse.class);
                
               // Store data in a formatted string
                storeAllData += 'Title: ' + responseData.Title + '\n';
                storeAllData += 'Year: ' + responseData.Year + '\n';
                storeAllData += 'Genre: ' + responseData.Genre + '\n';
                storeAllData += 'Director: ' + responseData.Director + '\n';
                storeAllData += 'Plot: ' + responseData.Plot + '\n';
                System.debug('All Data return ' + storeAllData);
                return storeAllData;
            } else{
                return 'Error: Failed to fetch movie details. Status Code: ' + response.getStatusCode();
            
            }
        } catch(Exception e){
            return 'Error: Unable to fetch movie details due to an exception.' + e.getMessage();
        }
        
   }
   
   class MovieApiResponse{
        public String Title;
        public String Year;
        public String Genre;
        public String Director;
        public String Plot;
    }
    
    
   
}