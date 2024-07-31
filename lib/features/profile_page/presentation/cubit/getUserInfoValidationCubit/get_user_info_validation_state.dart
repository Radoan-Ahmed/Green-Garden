part of 'get_user_info_validation_cubit.dart';

class GetUserInfoValidationState extends Equatable {
  final String? email;
  final String? role;
  final String? phoneNumber;


  const GetUserInfoValidationState({
    this.email = "email@gmail.com",
    this.role = "User",
    this.phoneNumber = "01788787873",
  });

  GetUserInfoValidationState copyWith({
    final String? email,
    final String? role,
    final String? phoneNumber,
  }) {
    return GetUserInfoValidationState(
      email: email ?? this.email,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }


  @override
  List<Object?> get props => [
        email,
        role,
        phoneNumber,
      ];
}

final class ForgetPasswordValidationInitial extends GetUserInfoValidationState {}
