part of 'forget_password_validation_cubit.dart';

class ForgetPasswordValidationState extends Equatable {
  final String? email;
  final String? saveEmail;
  final String? otpCode;
  final String? newPassEmail;
  final String? newPass;
  final String? newConfirmPass;


  const ForgetPasswordValidationState({
    this.email,
    this.saveEmail,
    this.otpCode,
    this.newPassEmail,
    this.newPass,
    this.newConfirmPass,
  });

  ForgetPasswordValidationState copyWith({
    final String? email,
    final String? saveEmail,
    final String? otpCode,
    final String? newPassEmail,
    final String? newPass,
    final String? newConfirmPass,
  }) {
    return ForgetPasswordValidationState(
      email: email ?? this.email,
      saveEmail: saveEmail ?? this.saveEmail,
      otpCode: otpCode ?? this.otpCode,
      newPassEmail : newPassEmail ?? this.newPassEmail,
      newPass: newPass ?? this.newPass,
      newConfirmPass: newConfirmPass ?? this.newConfirmPass,
    );
  }

  ResetPasswordApiRequestModel resetPasswordApiRequestModel(){
    return ResetPasswordApiRequestModel(
      email: newPassEmail,
      password: newPass,
      confirmPassword: newConfirmPass,
    );
  }

  

  VerifyEmailRequestModel verifyEmailRequestModel(){
    return VerifyEmailRequestModel(
      email: email,
    );
  }

  VerifyEmailCodeRequestModel verifyEmailCodeRequestModel(){

    return VerifyEmailCodeRequestModel(
      email: saveEmail,
      code: otpCode,
    );
  }


  @override
  List<Object?> get props => [
        email,
        saveEmail,
        otpCode,
        newPassEmail,
        newPass,
        newConfirmPass
      ];
}

final class ForgetPasswordValidationInitial extends ForgetPasswordValidationState {}
