import 'package:food_recipe/features/forget_password/data/model/reset_password_api_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/reset_password_api_response_model.dart';

abstract class ResetPasswordApiRepository {
  Future<ResetPasswordApiResponseModel> resetPasswordApi(ResetPasswordApiRequestModel resetPasswordApiRequestModel);
}