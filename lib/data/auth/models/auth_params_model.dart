import 'package:movie_app/domain/auth/entities/auth_params.dart';

class AuthParamsModel extends AuthParams {
  AuthParamsModel({required super.email, required super.password});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory AuthParamsModel.fromJson(Map<String, dynamic> map) {
    return AuthParamsModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  factory AuthParamsModel.fromEntity(AuthParams params) {
    return AuthParamsModel(
      email: params.email,
      password: params.password,
    );
  }
}
