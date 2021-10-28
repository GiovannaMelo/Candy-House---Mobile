import 'package:equatable/equatable.dart';

enum LoginStatus { loading, success, error, init }

class LoginStates extends Equatable {
  final LoginStatus status;

  const LoginStates._({
    this.status: LoginStatus.loading,
  });

  LoginStates.loading() : this._(status: LoginStatus.loading);

  LoginStates.success() : this._(status: LoginStatus.success);

  LoginStates.init() : this._(status: LoginStatus.init);

  LoginStates.error() : this._(status : LoginStatus.error);

  @override
  List<Object?> get props => [status];

}
