import 'package:wealth_lens/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';
import 'package:wealth_lens/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<AppUser?> getCurrentUser() => authRemoteDataSource.getCurrentUser();

  @override
  Future<AppUser> signIn({required String email, required String password}) => authRemoteDataSource.signIn(email, password);

  @override
  Future<void> signOut() => authRemoteDataSource.signOut();

  @override
  Future<AppUser> signUp({required String email, required String password}) => authRemoteDataSource.signUp(email, password);

}