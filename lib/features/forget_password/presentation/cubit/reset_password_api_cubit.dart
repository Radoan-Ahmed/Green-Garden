import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/features/forget_password/data/model/reset_password_api_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/reset_password_api_response_model.dart';
import 'package:food_recipe/features/forget_password/domain/usecase/reset_password_api_usecase.dart';

part 'reset_password_api_state.dart';

class ResetPasswordApiCubit extends Cubit<ResetPasswordApiState> {
  final ResetPasswordApiUseCase resetPasswordApiUseCase;
  ResetPasswordApiCubit({
    required this.resetPasswordApiUseCase,
  }) : super(ResetPasswordApiInitial());

  Future<void> resetPasswordApi(ResetPasswordApiRequestModel resetPasswordApiRequestModel) async{
    log("enter cubit");
    try{

      emit(ResetPasswordApiLoading());
      final responseModel = await resetPasswordApiUseCase(resetPasswordApiRequestModel);

      emit(ResetPasswordApiSucceed(model: responseModel));

    }catch(ex, strackTrace){
      emit(ResetPasswordApiFailed(ex, strackTrace));
    }
  }


}
