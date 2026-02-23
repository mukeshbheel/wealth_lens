import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';

import '../repositories/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository repository;

  GetCurrentUser({required this.repository});

  Future<AppUser?> call() async {
    return await repository.getCurrentUser();
  }
}