part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}


class LoginLoading extends LoginState {}

class LoginFailed extends LoginState {
  final StackTrace stackTrace;
  final Object exception;

  const LoginFailed(this.exception, this.stackTrace);
}

class LoginSucceed extends LoginState {
  final LoginResponseModel model;

  const LoginSucceed({
    required this.model,
  });
}
