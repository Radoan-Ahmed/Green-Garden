import 'package:food_recipe/features/profile_page/data/model/get_user_info_response_model.dart';

abstract class GetUserInfoRepository {
  Future<GetUserInfoResponseModel> getUserInfo();
}