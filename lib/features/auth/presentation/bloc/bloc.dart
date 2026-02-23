import 'package:bloc/bloc.dart';
import 'package:wealth_lens/features/auth/domain/usecases/get_current_user.dart';
import 'package:wealth_lens/features/auth/domain/usecases/sign_in.dart';
import 'package:wealth_lens/features/auth/domain/usecases/sign_out.dart';
import 'package:wealth_lens/features/auth/domain/usecases/sign_up.dart';
import 'package:wealth_lens/features/auth/presentation/bloc/events.dart';
import 'package:wealth_lens/features/auth/presentation/bloc/state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthAppState> {
  final SignIn signIn;
  final SignUp signUp;
  final SignOut signOut;
  final GetCurrentUser getCurrentUser;

  AuthBloc({
    required this.signIn,
    required this.signUp,
    required this.signOut,
    required this.getCurrentUser,
  }) : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      emit(AuthLoading());

      final user = await getCurrentUser();

      if(user == null){
        emit(AuthUnAuthenticated());
      }else{
        emit(AuthAuthenticated(user: user));
      }

    });
  }
}
