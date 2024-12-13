import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/data/auth/models/auth_params_model.dart';
import 'package:movie_app/data/auth/models/log_in_model.dart';
import 'package:movie_app/data/auth/models/sign_up_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<SignUpModel> signUp(AuthParamsModel params);

  Future<LogInModel> logIn(AuthParamsModel params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<LogInModel> logIn(AuthParamsModel params) async {
    try {
      final response = await dio.post(ApiUrl.signin, data: params.toJson());

      final data = Map<String, dynamic>.from(response.data);

      return LogInModel.fromJson(data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw ServerException('Connection timeout. Please try again later.');
      }
      throw ServerException(e.response!.data['message']);
    }
  }

  @override
  Future<SignUpModel> signUp(AuthParamsModel params) async {
    try {
      final response = await dio.post(ApiUrl.signup, data: {
        ...params.toJson(),
        'username': 'null',
      });

      final data = Map<String, dynamic>.from(response.data);

      return SignUpModel.fromJson(data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw ServerException('Connection timeout. Please try again later.');
      }
      throw ServerException(e.response!.data['message']);
    }
  }
}
