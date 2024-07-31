import 'package:food_recipe/features/login_page/data/model/login_requestion_model.dart';

import '../../data/model/login_response_model.dart';

abstract class LoginRepository {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel);
}