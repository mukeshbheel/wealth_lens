import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wealth_lens/features/auth/domain/usecases/sign_out.dart';
import 'package:wealth_lens/features/auth/domain/usecases/sign_up.dart';
import 'package:wealth_lens/features/auth/presentation/bloc/state.dart';
import 'features/auth/presentation/bloc/bloc.dart';
import 'features/auth/presentation/bloc/events.dart';
import 'features/auth/presentation/pages/login_page.dart';

import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/sign_in.dart';
import 'features/auth/domain/usecases/get_current_user.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://yyotcgdxtglvnfzryfpm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl5b3RjZ2R4dGdsdm5menJ5ZnBtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4OTg3MTAsImV4cCI6MjA4NzQ3NDcxMH0.CsqFYjYTqYzx-B8KEyuGMbXVdMW6N_mlDRlCJbye0Ug',
  );

  final supabase = Supabase.instance.client;

  /// Setup dependencies manually (we’ll add get_it later)
  final remoteDataSource = AuthRemoteDataSourceImpl(client: supabase);
  final repository = AuthRepositoryImpl(authRemoteDataSource: remoteDataSource,);

  runApp(MyApp(repository));
}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl repository;

  const MyApp(this.repository, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(
        signIn: SignIn(repository: repository,),
        signUp: SignUp(repository: repository,),
        signOut: SignOut(repository: repository,),
        getCurrentUser: GetCurrentUser(repository: repository),
      )..add(AppStarted()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthAppState>(
      builder: (context, state) {

        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is AuthAuthenticated) {
          return const DashboardPage();
        }

        return const LoginPage();
      },
    );
  }
}