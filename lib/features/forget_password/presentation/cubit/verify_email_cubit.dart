import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_response_model.dart';
import 'package:food_recipe/features/forget_password/domain/usecase/verify_email_usecase.dart';
part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final VerifyEmailUseCase verifyEmailUseCase;
  VerifyEmailCubit({
    required this.verifyEmailUseCase,
  }) : super(VerifyEmailInitial());

  Future<void> verifyEmail(VerifyEmailRequestModel verifyEmailRequestModel) async{
    print("enter cubit");
    try{

      emit(VerifyEmailLoading());
      final responseModel = await verifyEmailUseCase(verifyEmailRequestModel);

      emit(VerifyEmailSucceed(model: responseModel));

    }catch(ex, strackTrace){
      emit(VerifyEmailFailed(ex, strackTrace));
    }
  }


}
