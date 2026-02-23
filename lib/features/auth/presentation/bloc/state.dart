import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';

abstract class AuthAppState {}

class AuthInitial extends AuthAppState {}

class AuthLoading extends AuthAppState {}

class AuthAuthenticated extends AuthAppState {
  final AppUser user;

  AuthAuthenticated({required this.user});
}

class AuthUnAuthenticated extends AuthAppState {}