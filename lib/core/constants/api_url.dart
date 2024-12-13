class ApiUrl {
  static const baseURL = 'https://tmdb-movie-backend.onrender.com';
  static const authApiV = '/api/v1/user';
  static const movieApiV = '/api/v1/movie';
  static const searchApiV = '/api/v1/search';

  static const signup = '$authApiV/register';
  static const signin = '$authApiV/login';

  static const trendingMovies = '$movieApiV/trending';
  static const nowPlayingMovies = '$movieApiV/nowplaying';
  static const upcomingMovies = '$movieApiV/upcoming';

  static const searchMovies = '$searchApiV/';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
}
