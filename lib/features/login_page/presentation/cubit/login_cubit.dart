import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/features/login_page/data/model/login_requestion_model.dart';
import 'package:food_recipe/features/login_page/data/model/login_response_model.dart';
import 'package:food_recipe/features/login_page/domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit({
    required this.loginUseCase,
  }) : super(LoginInitial());

  Future<void> login(LoginRequestModel loginRequestModel) async{
    try{

      emit(LoginLoading());
      final responseModel = await loginUseCase(loginRequestModel);

      emit(LoginSucceed(model: responseModel));

    }catch(ex, strackTrace){
      emit(LoginFailed(ex, strackTrace));
    }
  }


}
