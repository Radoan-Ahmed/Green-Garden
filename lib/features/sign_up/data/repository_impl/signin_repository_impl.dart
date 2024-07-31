import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/network/connection_checker.dart';
import 'package:food_recipe/features/sign_up/data/model/signin_request_model.dart';
import 'package:food_recipe/features/sign_up/data/model/signin_response_model.dart';
import 'package:food_recipe/features/sign_up/data/remote/signin_remote.dart';
import 'package:food_recipe/features/sign_up/domain/repository/signin_repository.dart';

class SignInRepositoryImpl implements SignInRepository{
  final ConnectionChecker connectionChecker;
  final SignInRemote signInRemote;

  SignInRepositoryImpl(
    this.connectionChecker,
    this.signInRemote,
  );

  @override
  Future<SignInResponseModel> signIn(SignInRequestModel signInRequestModel) async{
    if(!await connectionChecker.isConnected()) throw NoInternetException();
    SignInResponseModel signInResponseModel = 
    await signInRemote.signIn(signInRequestModel);
    return signInResponseModel;
  }

}