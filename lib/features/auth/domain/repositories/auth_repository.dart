import 'package:dartz/dartz.dart';
import 'package:wealth_lens/core/error/failures.dart';
import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  Future<Either<Failures, AppUser>> signIn({required String email, required String password});
  Future<Either<Failures, AppUser>> signUp({required String email, required String password});

  Future<Either<Failures, void>> signOut();

  Future<Either<Failures, AppUser?>> getCurrentUser();
}
