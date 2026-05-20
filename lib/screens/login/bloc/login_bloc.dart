import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydroinator/services/firebase/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;
  LoginBloc({required this.authService}) : super(const LoginState()) {
    on<LoginSubmittedEvent>((event, emit) async {
      emit(state.copyWith(status: LoginStatus.loading));
      if (event.isLogin) {
        try {
          await authService.login(event.username, event.password);
          emit(state.copyWith(
            status: LoginStatus.success,
          ));
        } catch (e) {
          emit(state.copyWith(
              status: LoginStatus.failure,
              errorMessage: "Nieprawidłowe dane logowania"));
        }
      } else {
        try {
          await authService.register(event.username, event.password);
          emit(state.copyWith(
            status: LoginStatus.success,
          ));
        } catch (e) {
          emit(state.copyWith(
              status: LoginStatus.failure,
              errorMessage: "Nieprawidłowe dane rejestracji"));
        }
      }
    });
  }
}
