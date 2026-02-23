import 'package:supabase/supabase.dart';
import 'package:wealth_lens/features/auth/data/models/app_user_model.dart';
import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';

abstract class AuthRemoteDataSource {
  Future<AppUser> signIn(String email, String password);
  Future<AppUser> signUp(String email, String password);
  Future<void> signOut();
  Future<AppUser?> getCurrentUser();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource{

  final SupabaseClient client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<AppUser?> getCurrentUser() async {
    final user = client.auth.currentUser;
    if(user == null) return null;

    return AppUserModel.fromSupabase(user);
  }

  @override
  Future<AppUser> signIn(String email, String password) async {
    final response = await client.auth.signInWithPassword(email: email, password: password);
    final user = response.user;
    if(user == null){
      throw Exception("Login Failed");
    }
    return AppUserModel.fromSupabase(user);
  }

  @override
  Future<void> signOut() async {
    await client.auth.signOut();
  }

  @override
  Future<AppUser> signUp(String email, String password) async {
    final response = await client.auth.signUp(email: email, password: password);
    final user = response.user;
    if(user == null){
      throw Exception("Sign up failed");
    }

    return AppUserModel.fromSupabase(user);
  }
  
}