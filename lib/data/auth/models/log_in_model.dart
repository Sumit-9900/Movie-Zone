import 'package:movie_app/domain/auth/entities/log_in.dart';

class LogInModel extends LogIn {
  LogInModel({
    required super.statusCode,
    required super.data,
    required super.message,
    required super.success,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        statusCode: json["statusCode"],
        data: DataModel.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": (data as DataModel).toJson(),
        "message": message,
        "success": success,
      };
}

class DataModel extends Data {
  DataModel({required super.user, required super.token});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        user: UserModel.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": (user as UserModel).toJson(),
        "token": token,
      };
}

class UserModel extends User {
  UserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.password,
    required super.createdAt,
    required super.updatedAt,
    required super.v,
    required super.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "refreshToken": refreshToken,
      };
}
