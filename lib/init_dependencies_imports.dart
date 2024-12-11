import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/interceptors.dart';
import 'package:movie_app/core/usecase/is_user_logged_in.dart';
import 'package:movie_app/data/auth/datasources/auth_remote_data_source.dart';
import 'package:movie_app/data/auth/repositories/auth_repositories_impl.dart';
import 'package:movie_app/data/home/datasources/home_remote_data_source.dart';
import 'package:movie_app/data/home/repositories/home_repositories_impl.dart';
import 'package:movie_app/data/watch/datasources/watch_remote_data_source.dart';
import 'package:movie_app/data/watch/repositories/watch_repositories_impl.dart';
import 'package:movie_app/domain/auth/repositories/auth_repositories.dart';
import 'package:movie_app/domain/auth/usecases/log_in.dart';
import 'package:movie_app/domain/auth/usecases/sign_up.dart';
import 'package:movie_app/domain/home/repositories/home_repositories.dart';
import 'package:movie_app/domain/home/usecases/get_now_playing_movies.dart';
import 'package:movie_app/domain/home/usecases/get_trending_movies.dart';
import 'package:movie_app/domain/home/usecases/get_upcoming_movies.dart';
import 'package:movie_app/domain/watch/repositories/watch_repositories.dart';
import 'package:movie_app/domain/watch/usecases/get_movie_recommendations.dart';
import 'package:movie_app/domain/watch/usecases/get_movie_similars.dart';
import 'package:movie_app/domain/watch/usecases/get_movie_trailer.dart';
import 'package:movie_app/presentation/auth/bloc/auth_bloc.dart';
import 'package:movie_app/presentation/splash/cubit/splash_cubit.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_bloc.dart';

part 'init_dependencies.dart';
