import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_code_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_code_response.dart';
import 'package:food_recipe/features/forget_password/domain/usecase/verify_email_code_usecase.dart';

part 'verify_email_code_state.dart';

class VerifyEmailCodeCubit extends Cubit<VerifyEmailCodeState> {
  final VerifyEmailCodeUseCase verifyEmailUseCase;
  VerifyEmailCodeCubit({
    required this.verifyEmailUseCase,
  }) : super(VerifyEmailCodeInitial());

  Future<void> verifyEmail(VerifyEmailCodeRequestModel verifyEmailRequestModel) async{
    print("enter cubit");
    try{

      emit(VerifyEmailCodeLoading());
      final responseModel = await verifyEmailUseCase(verifyEmailRequestModel);

      emit(VerifyEmailCodeSucceed(model: responseModel));

    }catch(ex, strackTrace){
      emit(VerifyEmailCodeFailed(ex, strackTrace));
    }
  }


}
