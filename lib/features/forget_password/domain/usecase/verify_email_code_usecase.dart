
import 'package:food_recipe/features/forget_password/data/model/verify_email_code_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_code_response.dart';
import 'package:food_recipe/features/forget_password/domain/repository/verify_email_code_repository.dart';

class VerifyEmailCodeUseCase {
  final VerifyEmailCodeRepository _verifyEmailCodeRepository;

  VerifyEmailCodeUseCase(this._verifyEmailCodeRepository);

  Future<VerifyEmailCodeResponseModel> call(VerifyEmailCodeRequestModel verifyEmailCodeRequestModel) =>
      _verifyEmailCodeRepository.verifyEmailCode(verifyEmailCodeRequestModel);
}
