import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/features/sign_up/data/model/signin_request_model.dart';

part 'signin_validation_state.dart';

class SignInValidationCubit extends Cubit<SignInValidationState> {
  SignInValidationCubit() : super(SignInValidationInitial());

  void changeEmail(String email){
    emit(state.copyWith(
      email: email
    ));
  
  }

  void changePassword(String password){
    emit(state.copyWith(
      password: password,
    ));
  }

  void changeConfirmPassword(String confirmPassword){
    emit(state.copyWith(
      confirmPassword: confirmPassword,
    ));
  }

  void changeFullName(String fullName){
    emit(state.copyWith(
      fullName: fullName,
    ));
  }

  void changePhoneNumber(String phoneNumber){
    emit(state.copyWith(
      phoneNumber: phoneNumber,
    ));
  }

  void changeAddress(String address){
    emit(state.copyWith(
      address: address,
    ));
  }
  

}
