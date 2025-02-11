import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockbay/domain/models/user_models.dart';
import '../services/auth_service.dart';

// Estados
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated(this.user);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

// Eventos
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String login;
  final String password;
  LoginEvent(this.login, this.password);
}

class LogoutEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        User? user = await _authService.login(event.login, event.password);
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthError("Credenciais inválidas"));
        }
      } catch (e, stacktrace) {
        debugPrint("Erro no login: $e");
        debugPrint("Stacktrace: $stacktrace");

        emit(AuthError("Erro ao fazer login: ${e.toString()}"));
      }
    });

    on<LogoutEvent>((event, emit) async {
      await _authService.logout();
      emit(AuthInitial());
    });
  }
}
