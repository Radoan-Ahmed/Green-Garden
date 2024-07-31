
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/features/forget_password/data/model/reset_password_api_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_code_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'forget_password_validation_state.dart';

class ForgetPasswordValidationCubit extends Cubit<ForgetPasswordValidationState> {
  ForgetPasswordValidationCubit() : super(ForgetPasswordValidationInitial());

  void changeEmail(String email){
    emit(state.copyWith(
      email: email
    ));
  
  }

  void changeNewPassEmail(String newPassEmail){
    emit(state.copyWith(
      newPassEmail: newPassEmail,
    ));
  }

  void changeNewPass(String newPass){
    emit(state.copyWith(
      newPass: newPass,
    ));
  }

  void changeNewConfirmPass(String newConfirmPass){
    emit(state.copyWith(
      newConfirmPass: newConfirmPass,
    ));
  }

  void changeOtpCode(String otpCode){
    emit(state.copyWith(
      otpCode: otpCode,
    ));
  }

  void getSaveEmail()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(
      saveEmail: prefs.getString("email"),
    ));
  }

  

}
