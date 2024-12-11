part of 'init_dependencies_imports.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
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

  serviceLocator.registerLazySingleton(() => dio);

  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
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

  serviceLocator.registerFactory<AuthRepositories>(
    () => AuthRepositoriesImpl(
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

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogIn: serviceLocator(),
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
