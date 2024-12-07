class UserResponse {
  final bool success;
  final User user;

  UserResponse({
    required this.success,
    required this.user,
  });
}

class User {
  final String email;
  final String password;
  final String image;
  final List<dynamic> searchHistory;
  final String id;
  final int v;
  final String token;

  User({
    required this.email,
    required this.password,
    required this.image,
    required this.searchHistory,
    required this.id,
    required this.v,
    required this.token,
  });
}
