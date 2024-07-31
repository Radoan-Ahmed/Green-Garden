import 'package:food_recipe/features/forget_password/data/model/verify_email_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_response_model.dart';

abstract class VerifyEmailRepository {
  Future<VerifyEmailResponseModel> verifyEmail(VerifyEmailRequestModel verifyEmailRequestModel);
}