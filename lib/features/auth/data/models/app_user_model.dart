import 'package:supabase/supabase.dart';
import 'package:wealth_lens/features/auth/domain/entities/app_user.dart';

class AppUserModel extends AppUser {
  AppUserModel({required super.id, required super.email});

  factory AppUserModel.fromSupabase(User user){
    return AppUserModel(id: user.id, email: user.email ?? '');
  }

  factory AppUserModel.fromJson(Map<String, dynamic> json){
    return AppUserModel(id: json['id'], email: json['email']);
  }

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'email': email,
    };
  }

}