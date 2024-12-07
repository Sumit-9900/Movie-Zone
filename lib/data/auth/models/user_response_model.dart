import 'package:movie_app/domain/auth/entities/user_response.dart';

// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponseModel userResponseModelFromJson(String str) =>
    UserResponseModel.fromJson(json.decode(str));

String userResponseModelToJson(UserResponseModel data) =>
    json.encode(data.toJson());

class UserResponseModel extends UserResponse {
  UserResponseModel({required super.success, required super.user});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        success: json["success"],
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "user": (user as UserModel).toJson(),
      };
}

class UserModel extends User {
  UserModel({
    required super.email,
    required super.password,
    required super.image,
    required super.searchHistory,
    required super.id,
    required super.v,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        image: json["image"],
        searchHistory: List<dynamic>.from(json["searchHistory"].map((x) => x)),
        id: json["_id"],
        v: json["__v"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "image": image,
        "searchHistory": List<dynamic>.from(searchHistory.map((x) => x)),
        "_id": id,
        "__v": v,
        "token": token,
      };
}
