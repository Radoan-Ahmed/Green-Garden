import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/network/connection_checker.dart';
import 'package:food_recipe/features/profile_page/data/model/get_user_info_response_model.dart';
import 'package:food_recipe/features/profile_page/data/remote/get_user_info_remote.dart';
import 'package:food_recipe/features/profile_page/domain/repository/get_user_info_repository.dart';

class GetUserInfoRepositoryImpl implements GetUserInfoRepository{
  final ConnectionChecker connectionChecker;
  final GetUserInfoRemote getUserInfoRemote;

  GetUserInfoRepositoryImpl(
    this.connectionChecker,
    this.getUserInfoRemote,
  );

  @override
  Future<GetUserInfoResponseModel> getUserInfo() async{
    if(!await connectionChecker.isConnected()) throw NoInternetException();
    GetUserInfoResponseModel getUserInfoResponseModel = 
    await getUserInfoRemote.getUserInfo();
    return getUserInfoResponseModel;
  }

  


}