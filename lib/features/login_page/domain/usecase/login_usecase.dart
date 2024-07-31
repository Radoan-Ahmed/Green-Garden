
import 'package:food_recipe/features/login_page/data/model/login_requestion_model.dart';
import 'package:food_recipe/features/login_page/data/model/login_response_model.dart';
import 'package:food_recipe/features/login_page/domain/repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<LoginResponseModel> call(LoginRequestModel loginRequestModel) =>
      _loginRepository.login(loginRequestModel);
}
