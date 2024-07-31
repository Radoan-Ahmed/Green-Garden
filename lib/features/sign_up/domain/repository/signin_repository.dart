import 'package:food_recipe/features/sign_up/data/model/signin_request_model.dart';
import 'package:food_recipe/features/sign_up/data/model/signin_response_model.dart';


abstract class SignInRepository {
  Future<SignInResponseModel> signIn(SignInRequestModel signInRequestModel);
}