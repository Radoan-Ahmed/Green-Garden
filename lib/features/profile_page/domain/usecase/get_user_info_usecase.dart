
import 'package:food_recipe/features/profile_page/data/model/get_user_info_response_model.dart';
import 'package:food_recipe/features/profile_page/domain/repository/get_user_info_repository.dart';

class GetUserInfoUseCase {
  final GetUserInfoRepository _getUserInfoRepository;

  GetUserInfoUseCase(this._getUserInfoRepository);

  Future<GetUserInfoResponseModel> call() =>
      _getUserInfoRepository.getUserInfo();
}
