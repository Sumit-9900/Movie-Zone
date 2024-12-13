part of 'init_dependencies_imports.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiUrl.baseURL,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.add(LoggerInterceptor());

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  serviceLocator.registerLazySingleton(() => dio);

  serviceLocator.registerLazySingleton(() => prefs);

  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<WatchRemoteDataSource>(
    () => WatchRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AuthRepositories>(
    () => AuthRepositoriesImpl(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<HomeRepositories>(
    () => HomeRepositoriesImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<WatchRepositories>(
    () => WatchRepositoriesImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SearchRepositories>(
    () => SearchRepositoriesImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSignUp(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserLogIn(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserLogOut(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => IsUserLoggedIn(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetTrendingMovies(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetNowPlayingMovies(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetUpcomingMovies(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetMovieTrailer(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetMovieRecommendations(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetMovieSimilars(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetSearchedMovies(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogIn: serviceLocator(),
      userLogOut: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SplashCubit(
      isUserLoggedIn: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => TrailerBloc(
      getMovieTrailer: serviceLocator(),
    ),
  );
}
