import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/data/auth/models/auth_params_model.dart';
import 'package:movie_app/data/auth/models/user_response_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserResponseModel> signUp(AuthParamsModel params);

  Future<UserResponseModel> logIn(AuthParamsModel params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserResponseModel> logIn(AuthParamsModel params) async {
    try {
      final response = await dio.post(ApiUrl.signin, data: params.toJson());

      final data = Map<String, dynamic>.from(response.data);

      return UserResponseModel.fromJson(data);
    } on DioException catch (e) {
      throw ServerException(e.response!.data['message']);
    }
  }

  @override
  Future<UserResponseModel> signUp(AuthParamsModel params) async {
    try {
      final response = await dio.post(ApiUrl.signup, data: params.toJson());

      final data = Map<String, dynamic>.from(response.data);

      return UserResponseModel.fromJson(data);
    } on DioException catch (e) {
      throw ServerException(e.response!.data['message']);
    }
  }
}
