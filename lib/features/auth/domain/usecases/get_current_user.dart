import 'package:dartz/dartz.dart';
import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository repository;

  GetCurrentUser({required this.repository});

  Future<Either<Failures, AppUser?>> call() async {
    return await repository.getCurrentUser();
  }
}