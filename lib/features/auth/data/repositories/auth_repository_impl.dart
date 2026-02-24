import 'package:dartz/dartz.dart';
import 'package:supabase/supabase.dart';
import 'package:wealth_lens/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';
import 'package:wealth_lens/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, AppUser?>> getCurrentUser() async {
    try{
      final user = await authRemoteDataSource.getCurrentUser();
      return Right(user);
    } on AuthException catch (e){
      return Left(AuthFailure(message: e.message));
    }catch (e) {
      return Left(ServerFailure(message: "Unexpected error occurred"));
    }
  }

  @override
  Future<Either<Failures, AppUser>> signIn({required String email, required String password}) async {
    try{
      final user = await authRemoteDataSource.signIn(email, password);
      return Right(user);
    } on AuthException catch (e){
      return Left(AuthFailure(message: e.message));
    }catch (e) {
      return Left(ServerFailure(message: "Unexpected error occurred"));
    }
  }

  @override
  Future<Either<Failures, void>> signOut() async {
    try{
      await authRemoteDataSource.signOut();
      return Right(null);
    } on AuthException catch (e){
      return Left(AuthFailure(message: e.message));
    }catch (e) {
      return Left(ServerFailure(message: "Unexpected error occurred"));
    }
  }

  @override
  Future<Either<Failures, AppUser>> signUp({required String email, required String password}) async {
    try{
      final user = await authRemoteDataSource.signUp(email, password);
      return Right(user);
    } on AuthException catch (e){
      return Left(AuthFailure(message: e.message));
    }catch (e) {
      return Left(ServerFailure(message: "Unexpected error occurred"));
    }
  }

}