import 'dart:convert';
import 'dart:developer';

import 'package:food_recipe/core/constant/api_constans.dart';
import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/header_provider/header_provider.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_code_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_code_response.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_error_respones_model.dart';
import 'package:http/http.dart' as http;

abstract class VerifyEmailCodeRemote {
  Future<VerifyEmailCodeResponseModel> verifyEmailCode(VerifyEmailCodeRequestModel verifyEmailCodeRequestModel);
}

class VerifyEmailCodeRemoteImpl implements VerifyEmailCodeRemote{
  static String verifyEmailCodeEndpoint = ApiConstants.baseCommonApiVersionOne+ApiConstants.verifyEmailCodeApiUrl;
  final HeaderProvider _headerProvider;

  VerifyEmailCodeRemoteImpl(this._headerProvider);
  var url = Uri.parse(verifyEmailCodeEndpoint);

  @override
  Future<VerifyEmailCodeResponseModel> verifyEmailCode(VerifyEmailCodeRequestModel verifyEmailCodeRequestModel) async{
    VerifyEmailCodeResponseModel res;
    VerifyEmailErrorResponseModel errorRes;
    final headers = _headerProvider();
    final response = await http.post(url,
    body: json.encode(verifyEmailCodeRequestModel),
    headers: headers);
    log("the request : ${json.encode(verifyEmailCodeRequestModel)}");
      // print("the response is :${json.encode(response)}");
    if(response.statusCode == 200){
      res = verifyEmailCodeResponseModelFromJson(utf8.decode(response.bodyBytes));
      log("the response code is :${json.encode(res)}");
      return res;
    }else{
      errorRes = verifyEmailErrorResponseModelFromJson(utf8.decode(response.bodyBytes));
      log("the error code response is :${json.encode(errorRes)}");
      throw ServerException(
        message: errorRes.message,
        statusCode: errorRes.statusCode,
      );
    }
  }
  
}
