import 'package:equatable/equatable.dart';
import 'package:test_flutter/featuers/auth/data/model/log_in_body_model.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckLogin extends AuthEvent {
  final LogInBodyModel logInBodyModel;

  CheckLogin({required this.logInBodyModel});
}
