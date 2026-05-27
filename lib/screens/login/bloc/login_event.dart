part of 'login_bloc.dart';

sealed class LoginEvent {}

final class LoginSubmittedEvent extends LoginEvent {
  final String username;
  final String password;
  final bool isLogin;

  LoginSubmittedEvent({required this.username, required this.password, required this.isLogin});
}
