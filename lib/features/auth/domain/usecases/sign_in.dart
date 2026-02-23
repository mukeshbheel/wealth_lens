import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';
import 'package:wealth_lens/features/auth/domain/repositories/auth_repository.dart';

class SignIn {
  final AuthRepository repository;

  SignIn({required this.repository});

  Future<AppUser> call(String email, String password) async {
    return await repository.signIn(email: email, password: password);
  }
}