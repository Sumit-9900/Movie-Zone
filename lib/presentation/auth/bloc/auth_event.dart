part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final AuthParams params;
  AuthSignUp(this.params);
}

final class AuthLogIn extends AuthEvent {
  final AuthParams params;
  AuthLogIn(this.params);
}

final class AuthLogOut extends AuthEvent {}
