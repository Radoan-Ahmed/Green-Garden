
import 'package:food_recipe/features/forget_password/data/model/reset_password_api_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/reset_password_api_response_model.dart';
import 'package:food_recipe/features/forget_password/domain/repository/reset_password_api_repository.dart';

class ResetPasswordApiUseCase {
  final ResetPasswordApiRepository _resetPasswordApiRepository;

  ResetPasswordApiUseCase(this._resetPasswordApiRepository);

  Future<ResetPasswordApiResponseModel> call(ResetPasswordApiRequestModel resetPasswordApiRequestModel) =>
      _resetPasswordApiRepository.resetPasswordApi(resetPasswordApiRequestModel);
}
