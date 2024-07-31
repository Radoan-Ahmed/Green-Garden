import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/network/connection_checker.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_response_model.dart';
import 'package:food_recipe/features/forget_password/data/remote/verify_email_remote.dart';
import 'package:food_recipe/features/forget_password/domain/repository/verify_email_repository.dart';

class VerifyEmailRepositoryImpl implements VerifyEmailRepository{
  final ConnectionChecker connectionChecker;
  final VerifyEmailRemote verifyEmailRemote;

  VerifyEmailRepositoryImpl(
    this.connectionChecker,
    this.verifyEmailRemote,
  );

  @override
  Future<VerifyEmailResponseModel> verifyEmail(VerifyEmailRequestModel verifyEmailRequestModel) async{
    if(!await connectionChecker.isConnected()) throw NoInternetException();
    VerifyEmailResponseModel verifyEmailResponseModel = 
    await verifyEmailRemote.verifyEmail(verifyEmailRequestModel);
    return verifyEmailResponseModel;
  }

  


}