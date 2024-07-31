part of 'verify_email_code_cubit.dart';

sealed class VerifyEmailCodeState extends Equatable {
  const VerifyEmailCodeState();

  @override
  List<Object> get props => [];
}

final class VerifyEmailCodeInitial extends VerifyEmailCodeState {}


class VerifyEmailCodeLoading extends VerifyEmailCodeState {}

class VerifyEmailCodeFailed extends VerifyEmailCodeState {
  final StackTrace stackTrace;
  final Object exception;

  const VerifyEmailCodeFailed(this.exception, this.stackTrace);
}

class VerifyEmailCodeSucceed extends VerifyEmailCodeState {
  final VerifyEmailCodeResponseModel model;

  const VerifyEmailCodeSucceed({
    required this.model,
  });
}
