
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_info_validation_state.dart';

class GetUserInfoValidationCubit extends Cubit<GetUserInfoValidationState> {
  GetUserInfoValidationCubit() : super(ForgetPasswordValidationInitial());

  void changeEmail(String email){
    emit(state.copyWith(
      email: email
    ));
  
  }

  void changeRole(String role){
    emit(state.copyWith(
      role: role
    ));
  
  }

  void changePhoneNumber(String phoneNumber){
    emit(state.copyWith(
      phoneNumber: phoneNumber
    ));
  
  }


}
