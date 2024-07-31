import 'dart:convert';
import 'dart:developer';

import 'package:food_recipe/core/constant/api_constans.dart';
import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/header_provider/header_provider.dart';
import 'package:food_recipe/features/common/data/model/common_error_response_model.dart';
import 'package:food_recipe/features/profile_page/data/model/get_user_info_response_model.dart';
import 'package:http/http.dart' as http;

abstract class GetUserInfoRemote {
  Future<GetUserInfoResponseModel> getUserInfo();
}

class GetUserInfoRemoteImpl implements GetUserInfoRemote{
  static String loginEndpoint = ApiConstants.baseCommonApiVersionOne+ApiConstants.getUserInfoApiUrl;
  final HeaderProvider _headerProvider;

  GetUserInfoRemoteImpl(this._headerProvider);
  var url = Uri.parse(loginEndpoint);

  @override
  Future<GetUserInfoResponseModel> getUserInfo() async{
    GetUserInfoResponseModel res;
    CommonErrorResponseModel commonErrorRes;
    final headers = _headerProvider();
    final response = await http.get(url,
    headers: headers);
    log("the request : ${json.encode(headers)}");
      // log("the response is :${response}");
    if(response.statusCode == 200){
      res = getUserInfoResponseModelFromJson(utf8.decode(response.bodyBytes));
      log("the response is :${json.encode(res)}");
      return res;
    }else{
      commonErrorRes = commonErrorResponseModelFromJson(utf8.decode(response.bodyBytes));
      log("the error response is :${json.encode(commonErrorRes)}");
      throw ServerException(
        message: commonErrorRes.message,
        statusCode: response.statusCode,
      );
    }
  }
  
}
