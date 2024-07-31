part of 'signin_validation_cubit.dart';

class SignInValidationState extends Equatable {
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? fullName;
  final String? phoneNumber;
  final String? address;

  const SignInValidationState({
    this.email,
    this.password,
    this.confirmPassword,
    this.fullName,
    this.phoneNumber,
    this.address,
  });

  SignInValidationState copyWith({
    final String? email,
    final String? password,
    final String? confirmPassword,
    final String? fullName,
    final String? phoneNumber,
    final String? address,
  }) {
    return SignInValidationState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword : confirmPassword ?? this.confirmPassword,
      fullName : fullName ?? this.fullName,
      phoneNumber : phoneNumber ?? this.phoneNumber,
      address : address?? this.address,
    );
  }


  SignInRequestModel signInRequestModel(){
    return SignInRequestModel(
      email: email,
      fullName: fullName,
      phone: phoneNumber,
      password: password,
      confirmPassword: confirmPassword,
      address: address,
    );
  }


  @override
  List<Object?> get props => [
        email,
        password,
        confirmPassword,
        fullName,
        phoneNumber,
        address,
      ];
}

final class SignInValidationInitial extends SignInValidationState {}
