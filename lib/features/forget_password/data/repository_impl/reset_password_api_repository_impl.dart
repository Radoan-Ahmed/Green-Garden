import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/network/connection_checker.dart';
import 'package:food_recipe/features/forget_password/data/model/reset_password_api_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/reset_password_api_response_model.dart';
import 'package:food_recipe/features/forget_password/data/remote/reset_password_api_remote.dart';
import 'package:food_recipe/features/forget_password/domain/repository/reset_password_api_repository.dart';

class ResetPasswordApiRepositoryImpl implements ResetPasswordApiRepository{
  final ConnectionChecker connectionChecker;
  final ResetPasswordApiRemote resetPasswordApiRemote;

  ResetPasswordApiRepositoryImpl(
    this.connectionChecker,
    this.resetPasswordApiRemote,
  );

  @override
  Future<ResetPasswordApiResponseModel> resetPasswordApi(ResetPasswordApiRequestModel resetPasswordApiRequestModel) async{
    if(!await connectionChecker.isConnected()) throw NoInternetException();
    ResetPasswordApiResponseModel resetPasswordApiResponseModel = 
    await resetPasswordApiRemote.resetPasswordApi(resetPasswordApiRequestModel);
    return resetPasswordApiResponseModel;
  }

  


}