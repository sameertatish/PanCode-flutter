import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/auth/data/auth_api.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final DioAuth api;
  AuthBloc({required this.api}) : super(AuthInitialState()) {
    on<CheckLogin>(_checkLogin);
  }

  void _checkLogin(
    CheckLogin event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoadingState());
      var res = await api.checkLogIn(event.logInBodyModel);
      if (res.access != null) {
        sharedFunction.setShared(PrefKeys.tokenLoggedIn, res.access ?? '');
        emit(AuthLoadedState());
      }
    } catch (err) {
      emit(AuthFailureState(message: err.toString()));
    }
  }
}
