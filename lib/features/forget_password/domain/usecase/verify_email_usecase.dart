
import 'package:food_recipe/features/forget_password/data/model/verify_email_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_response_model.dart';
import 'package:food_recipe/features/forget_password/domain/repository/verify_email_repository.dart';

class VerifyEmailUseCase {
  final VerifyEmailRepository _verifyEmailRepository;

  VerifyEmailUseCase(this._verifyEmailRepository);

  Future<VerifyEmailResponseModel> call(VerifyEmailRequestModel verifyEmailRequestModel) =>
      _verifyEmailRepository.verifyEmail(verifyEmailRequestModel);
}
