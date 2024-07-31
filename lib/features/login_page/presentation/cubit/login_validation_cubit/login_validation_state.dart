part of 'login_validation_cubit.dart';

class LoginValidationState extends Equatable {
  final String? email;
  final String? password;

  const LoginValidationState({
    this.email,
    this.password,
  });

  LoginValidationState copyWith({
    final String? email,
    final String? password,
  }) {
    return LoginValidationState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }


  LoginRequestModel loginRequestModel(){
    return LoginRequestModel(
      password: password,
      email: email,
    );
  }


  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

final class LoginValidationInitial extends LoginValidationState {}
