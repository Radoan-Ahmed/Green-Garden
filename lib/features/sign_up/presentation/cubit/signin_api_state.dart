part of 'signin_api_cubit.dart';

sealed class SignInApiState extends Equatable {
  const SignInApiState();

  @override
  List<Object> get props => [];
}

final class SignInApiInitial extends SignInApiState {}


class SignInApiLoading extends SignInApiState {}

class SignInApiFailed extends SignInApiState {
  final StackTrace stackTrace;
  final Object exception;

  const SignInApiFailed(this.exception, this.stackTrace);
}

class SignInApiSucceed extends SignInApiState {
  final SignInResponseModel model;

  const SignInApiSucceed({
    required this.model,
  });
}
