
import 'package:food_recipe/features/sign_up/data/model/signin_request_model.dart';
import 'package:food_recipe/features/sign_up/data/model/signin_response_model.dart';
import 'package:food_recipe/features/sign_up/domain/repository/signin_repository.dart';

class SignInUseCase {
  final SignInRepository _signInRepository;

  SignInUseCase(this._signInRepository);

  Future<SignInResponseModel> call(SignInRequestModel signInRequestModel) =>
      _signInRepository.signIn(signInRequestModel);
}
