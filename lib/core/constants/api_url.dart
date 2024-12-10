class ApiUrl {
  static const baseURL = 'https://tmdb-movie-backend.onrender.com';
  static const movieApiV = '/api/v1/movie';

  static const signup = '${movieApiV}auth/signup';
  static const signin = '${movieApiV}auth/signin';

  static const trendingMovies = '$movieApiV/trending';
  static const nowPlayingMovies = '$movieApiV/nowplaying';
  static const upcomingMovies = '$movieApiV/upcoming';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
}
