public class CheckMovieDetails {
   @InvocableMethod(
        label='Get Movie Details' description='Retrieves movie details from the OMDb API based on the provided title and year'
    )
    public static List<String> movieDetails(List<MovieRequest> apiService){
        List<String> resultService = new List<String>();
        
        for(MovieRequest req : apiService){
            String movieData = MovieApiService.getImdbdata(req.title, req.year);
            resultService.add(movieData);
        }
        
        return resultService;
        
    }
      // Define a wrapper class for input parameters
    public class MovieRequest {
        @InvocableVariable(label='Movie Title' description='Enter the title of the movie' required=false)
        public String title;

        @InvocableVariable(label='Movie Year' description='Enter the release year of the movie' required=false)
        public String year;
    }
}