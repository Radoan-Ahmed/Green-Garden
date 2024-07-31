import 'dart:convert';
import 'dart:developer';

import 'package:food_recipe/core/constant/api_constans.dart';
import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/header_provider/header_provider.dart';
import 'package:food_recipe/features/common/data/model/common_error_response_model.dart';
import 'package:food_recipe/features/login_page/data/model/login_requestion_model.dart';
import 'package:food_recipe/features/login_page/data/model/login_response_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemote {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel);
}

class LoginRemoteImpl implements LoginRemote{
  static String loginEndpoint = ApiConstants.baseCommonApiVersionOne+ApiConstants.loginApiUrl;
  final HeaderProvider _headerProvider;

  LoginRemoteImpl(this._headerProvider);
  var url = Uri.parse(loginEndpoint);

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async{
    LoginResponseModel res;
    CommonErrorResponseModel commonErrorRes;
    final headers = _headerProvider();
    final response = await http.post(url,
    body: json.encode(loginRequestModel),
    headers: headers);
    log("the request : ${json.encode(headers)}");
      // log("the response is :${response}");
    if(response.statusCode == 200){
      res = loginResponseModelFromJson(utf8.decode(response.bodyBytes));
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
