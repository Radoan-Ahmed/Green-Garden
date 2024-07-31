part of 'verify_email_cubit.dart';

sealed class VerifyEmailState extends Equatable {
  const VerifyEmailState();

  @override
  List<Object> get props => [];
}

final class VerifyEmailInitial extends VerifyEmailState {}


class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailFailed extends VerifyEmailState {
  final StackTrace stackTrace;
  final Object exception;

  const VerifyEmailFailed(this.exception, this.stackTrace);
}

class VerifyEmailSucceed extends VerifyEmailState {
  final VerifyEmailResponseModel model;

  const VerifyEmailSucceed({
    required this.model,
  });
}
