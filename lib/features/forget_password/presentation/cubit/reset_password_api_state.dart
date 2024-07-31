part of 'reset_password_api_cubit.dart';

sealed class ResetPasswordApiState extends Equatable {
  const ResetPasswordApiState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordApiInitial extends ResetPasswordApiState {}


class ResetPasswordApiLoading extends ResetPasswordApiState {}

class ResetPasswordApiFailed extends ResetPasswordApiState {
  final StackTrace stackTrace;
  final Object exception;

  const ResetPasswordApiFailed(this.exception, this.stackTrace);
}

class ResetPasswordApiSucceed extends ResetPasswordApiState {
  final ResetPasswordApiResponseModel model;

  const ResetPasswordApiSucceed({
    required this.model,
  });
}
