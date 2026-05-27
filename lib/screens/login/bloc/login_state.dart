part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

 class LoginState extends Equatable {
  final String? errorMessage;
  final LoginStatus status;
  const LoginState({
    this.errorMessage,
    this.status = LoginStatus.initial,
  });

  LoginState copyWith({
    String? errorMessage,
    LoginStatus? status,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
  
  @override
  List<Object?> get props => [errorMessage, status];
}

