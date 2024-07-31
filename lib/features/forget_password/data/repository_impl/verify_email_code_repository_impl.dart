import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/network/connection_checker.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_code_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_code_response.dart';
import 'package:food_recipe/features/forget_password/data/remote/verify_email_code_remote.dart';
import 'package:food_recipe/features/forget_password/domain/repository/verify_email_code_repository.dart';

class VerifyEmailCodeRepositoryImpl implements VerifyEmailCodeRepository{
  final ConnectionChecker connectionChecker;
  final VerifyEmailCodeRemote verifyEmailCodeRemote;

  VerifyEmailCodeRepositoryImpl(
    this.connectionChecker,
    this.verifyEmailCodeRemote,
  );

  @override
  Future<VerifyEmailCodeResponseModel> verifyEmailCode(VerifyEmailCodeRequestModel verifyEmailCodeRequestModel) async{
    if(!await connectionChecker.isConnected()) throw NoInternetException();
    VerifyEmailCodeResponseModel verifyEmailCodeResponseModel = 
    await verifyEmailCodeRemote.verifyEmailCode(verifyEmailCodeRequestModel);
    return verifyEmailCodeResponseModel;
  }

  


}