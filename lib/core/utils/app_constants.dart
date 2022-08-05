class AppContants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '72b66dbbb9816e3f20405337150e741a';

  static const String nowPlayingMoviePath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviePath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviePath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
}
