abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {}

class AuthFailureState extends AuthState {
  final String message;

  AuthFailureState({required this.message});
}
