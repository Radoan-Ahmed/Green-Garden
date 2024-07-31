import 'package:food_recipe/features/forget_password/data/model/verify_email_code_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_code_response.dart';

abstract class VerifyEmailCodeRepository {
  Future<VerifyEmailCodeResponseModel> verifyEmailCode(VerifyEmailCodeRequestModel verifyEmailCodeRequestModel);
}