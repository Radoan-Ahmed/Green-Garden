import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/network/connection_checker.dart';
import 'package:food_recipe/features/login_page/data/model/login_requestion_model.dart';
import 'package:food_recipe/features/login_page/data/model/login_response_model.dart';
import 'package:food_recipe/features/login_page/data/remote/login_remote.dart';
import 'package:food_recipe/features/login_page/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository{
  final ConnectionChecker connectionChecker;
  final LoginRemote loginRemote;

  LoginRepositoryImpl(
    this.connectionChecker,
    this.loginRemote,
  );

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async{
    if(!await connectionChecker.isConnected()) throw NoInternetException();
    LoginResponseModel loginResponseModel = 
    await loginRemote.login(loginRequestModel);
    return loginResponseModel;
  }

  


}