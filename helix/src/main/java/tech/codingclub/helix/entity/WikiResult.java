package tech.codingclub.helix.entity;

//public class WikiResult {
  //  package tech.codingclub;

    public class WikiResult {
        //package utility;

        // public class WikiResult {
        String query;
        String result;
        String url;
        public WikiResult(String query,String result,String url)
        {
            this.query = query;
            this.result = result;
            this.url = url;
        }

        public String getResult() {
            return result;
        }

        public String getQuery() {
            return query;
        }

        public String getUrl() {
            return url;
        }
    }



