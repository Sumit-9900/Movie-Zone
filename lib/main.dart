import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/configs/theme/app_theme.dart';
import 'package:movie_app/init_dependencies_imports.dart';
import 'package:movie_app/presentation/auth/bloc/auth_bloc.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_bloc.dart';
import 'package:movie_app/presentation/home/bloc/trending_bloc.dart';
import 'package:movie_app/presentation/home/bloc/upcoming_bloc.dart';
import 'package:movie_app/presentation/home/pages/home_page.dart';
import 'package:movie_app/presentation/splash/cubit/splash_cubit.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<SplashCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<TrendingBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<NowPlayingBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<UpcomingBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const HomePage(),
    );
  }
}
