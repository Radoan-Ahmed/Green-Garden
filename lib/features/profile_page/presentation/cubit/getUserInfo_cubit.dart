import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/features/profile_page/data/model/get_user_info_response_model.dart';
import 'package:food_recipe/features/profile_page/domain/usecase/get_user_info_usecase.dart';

part 'getUserInfo_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  final GetUserInfoUseCase getUserInfoUseCase;
  GetUserInfoCubit({
    required this.getUserInfoUseCase,
  }) : super(GetUserInfoInitial());

  Future<void> getUserInfo() async{
    try{

      emit(GetUserInfoLoading());
      final responseModel = await getUserInfoUseCase();

      emit(GetUserInfoSucceed(model: responseModel));

    }catch(ex, strackTrace){
      emit(GetUserInfoFailed(ex, strackTrace));
    }
  }


}
