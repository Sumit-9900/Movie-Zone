import 'package:movie_app/domain/auth/entities/sign_up.dart';

class SignUpModel extends SignUp {
  SignUpModel({
    required super.statusCode,
    required super.data,
    required super.message,
    required super.success,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
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
    required super.username,
    required super.email,
    required super.password,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.v,
  });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
