class Constants{
  static String TOP_HEADLLINES_URL=
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=9d088cb65173431282336d0644263f91';
  static String headlinesFor(String keyword){
    return 'https://newsapi.org/v2/everything?q=$keyword&apiKey=9d088cb65173431282336d0644263f91';

  }
}