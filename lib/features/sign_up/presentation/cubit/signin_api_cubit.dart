import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/features/sign_up/data/model/signin_request_model.dart';
import 'package:food_recipe/features/sign_up/data/model/signin_response_model.dart';
import 'package:food_recipe/features/sign_up/domain/usecase/signin_usecase.dart';
part 'signin_api_state.dart';

class SignInApiCubit extends Cubit<SignInApiState> {
  final SignInUseCase signInApiUseCase;
  SignInApiCubit({
    required this.signInApiUseCase,
  }) : super(SignInApiInitial());

  Future<void> signInApi(SignInRequestModel signInApiRequestModel) async{
    try{

      emit(SignInApiLoading());
      final responseModel = await signInApiUseCase(signInApiRequestModel);

      emit(SignInApiSucceed(model: responseModel));

    }catch(ex, strackTrace){
      emit(SignInApiFailed(ex, strackTrace));
    }
  }


}
