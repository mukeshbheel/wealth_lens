import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final AppUser user;

  LoggedIn({required this.user});

}

class LoggedOut extends AuthEvent {}