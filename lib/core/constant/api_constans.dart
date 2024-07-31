

import 'package:food_recipe/core/constant/api_config.dart';

class ApiConstants {
  ApiConstants._();

  static String baseCommonApiVersionOne = "${ApiConfig.instance.baseUrl}/api/v1";
 

  static const loginApiUrl = "/auth/login";
  static const registerApiUrl = "/auth/register";
  static const verifyEmailApiUrl = "/auth/verify-email";
  static const verifyEmailCodeApiUrl = "/auth/verify-otp";
  static const resetPasswordApiUrl = "/auth/reset-password";
  static const getUserInfoApiUrl = "/auth/verify";

}
