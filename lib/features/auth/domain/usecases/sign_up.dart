import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';
import 'package:wealth_lens/features/auth/domain/repositories/auth_repository.dart';

class SignUp {
  final AuthRepository repository;

  SignUp({required this.repository});

  Future<AppUser> call(String email, String password) async {
    return await repository.signUp(email: email, password: password);
  }
}