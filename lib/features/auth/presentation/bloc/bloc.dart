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
    on<AppStarted>(_onAppStarted);
    on<LoginRequested>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  _onAppStarted(AppStarted event, Emitter<AuthAppState> emit) async {
    emit(AuthLoading());

    final result = await getCurrentUser();

    result.fold(
      (failure) {
        emit(AuthError(message: failure.message));
      },
      (user) {
        if (user == null) {
          emit(AuthUnAuthenticated());
        } else {
          emit(AuthAuthenticated(user: user));
        }
      },
    );
  }

  _onLoggedIn(LoginRequested event, Emitter<AuthAppState> emit) async {
    final result = await signIn(event.email, event.password);

    result.fold(
      (failure){
        emit(AuthError(message: failure.message));
      },
      (user){
        emit(AuthAuthenticated(user: user));
      },
    );
  }

  Future<void> _onLoggedOut(
      LoggedOut event,
      Emitter<AuthAppState> emit,
      ) async {
    await signOut();
    emit(AuthUnAuthenticated());
  }
}
