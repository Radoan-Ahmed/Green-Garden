import 'dart:convert';

import 'package:food_recipe/core/constant/api_constans.dart';
import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/header_provider/header_provider.dart';
import 'package:food_recipe/features/sign_up/data/model/signin_error_response_model.dart';
import 'package:food_recipe/features/sign_up/data/model/signin_request_model.dart';
import 'package:food_recipe/features/sign_up/data/model/signin_response_model.dart';
import 'package:http/http.dart' as http;

abstract class SignInRemote {
  Future<SignInResponseModel> signIn(SignInRequestModel signInRequestModel);
}

class SignInRemoteImpl implements SignInRemote{
  static String signInEndpoint = ApiConstants.baseCommonApiVersionOne+ApiConstants.registerApiUrl;
  final HeaderProvider _headerProvider;

  SignInRemoteImpl(this._headerProvider);
  var url = Uri.parse(signInEndpoint);

  @override
  Future<SignInResponseModel> signIn(SignInRequestModel signInRequestModel) async{
    SignInResponseModel res;
    SignInErrorResponseModel errorRes;
    final headers = _headerProvider();
    final response = await http.post(url,
    body: json.encode(signInRequestModel),
    headers: headers);
    if(response.statusCode == 201){
      res = signInResponseModelFromJson(utf8.decode(response.bodyBytes));
      print("the response is :${json.encode(res)}");
      return res;
    }else{
      errorRes = signInErrorResponseModelFromJson(utf8.decode(response.bodyBytes));
      print("the responses is :${json.encode(errorRes)}");
      throw ServerException(
        message: response.body,
        statusCode: response.statusCode,
      );
    }
  }
  
}
