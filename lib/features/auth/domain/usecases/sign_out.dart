import 'package:dartz/dartz.dart';
import 'package:wealth_lens/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';

class SignOut {
  final AuthRepository repository;

  SignOut({required this.repository});

  Future<Either<Failures, void>> call() async {
    return await repository.signOut();
  }
}