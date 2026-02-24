import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});

}

class LoggedOut extends AuthEvent {}