import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/features/login_page/data/model/login_requestion_model.dart';

part 'login_validation_state.dart';

class LoginValidationCubit extends Cubit<LoginValidationState> {
  LoginValidationCubit() : super(LoginValidationInitial());

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
  

}
