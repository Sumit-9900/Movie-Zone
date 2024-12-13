class LogIn {
  final int statusCode;
  final Data data;
  final String message;
  final bool success;

  LogIn({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });
}

class Data {
  final User user;
  final String token;

  Data({
    required this.user,
    required this.token,
  });
}

class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String refreshToken;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.refreshToken,
  });
}
