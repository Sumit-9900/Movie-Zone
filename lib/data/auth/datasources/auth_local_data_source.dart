import 'package:movie_app/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthLocalDataSource {
  Future<void> saveToken(String token);

  String? getToken();

  Future<bool> clearToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<bool> clearToken() async {
    try {
      return await sharedPreferences.clear();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  String? getToken() {
    return sharedPreferences.getString('token');
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await sharedPreferences.setString('token', token);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
