class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "4c7220ad5bfb3547684dcb7e090b807e";
  static const String authToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YzcyMjBhZDViZmIzNTQ3Njg0ZGNiN2UwOTBiODA3ZSIsInN1YiI6IjY0ZWVjZjZkOTdhNGU2MDBhYzNkOTg3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GlX8tmIHd6d1FW81AKqlLW-Xp4uoOfR2tTHejYhcb4M";
  static const String placeholderImage = "https://www.istockphoto.com/photo/empty-cinema-screen-with-audience-gm453554783-24692123";
  static const nowPlayingMovieEndPoint = "${baseUrl}movie/now_playing";
  static const populerMoviesEndPoint = "${baseUrl}movie/popular";
  static const topRatedMoviesEndPoint = "${baseUrl}movie/top_rated";

  static recommendationsEndPoint(int movieId) =>
      "${baseUrl}movie/$movieId/recommendations";
  static movieDetailsEndPoint(int movieId) => "${baseUrl}movie/$movieId";

  static const baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String imageUrl) {
    return "$baseImageUrl$imageUrl";
  }
}
