import 'dart:convert';

import 'package:food_recipe/core/constant/api_constans.dart';
import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/header_provider/header_provider.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_error_respones_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/verify_email_response_model.dart';
import 'package:http/http.dart' as http;

abstract class VerifyEmailRemote {
  Future<VerifyEmailResponseModel> verifyEmail(VerifyEmailRequestModel verifyEmailRequestModel);
}

class VerifyEmailRemoteImpl implements VerifyEmailRemote{
  static String verifyEmailEndpoint = ApiConstants.baseCommonApiVersionOne+ApiConstants.verifyEmailApiUrl;
  final HeaderProvider _headerProvider;

  VerifyEmailRemoteImpl(this._headerProvider);
  var url = Uri.parse(verifyEmailEndpoint);

  @override
  Future<VerifyEmailResponseModel> verifyEmail(VerifyEmailRequestModel verifyEmailRequestModel) async{
    VerifyEmailResponseModel res;
    VerifyEmailErrorResponseModel errorRes;
    final headers = _headerProvider();
    final response = await http.post(url,
    body: json.encode(verifyEmailRequestModel),
    headers: headers);
    print("the request : ${json.encode(verifyEmailRequestModel)}");
      // print("the response is :${json.encode(response)}");
    if(response.statusCode == 200){
      res = verifyEmailResponseModelFromJson(utf8.decode(response.bodyBytes));
      print("the response is :${json.encode(res)}");
      return res;
    }else{
      errorRes = verifyEmailErrorResponseModelFromJson(utf8.decode(response.bodyBytes));
      print("the error response is :${json.encode(errorRes)}");
      throw ServerException(
        message: errorRes.message,
        statusCode: errorRes.statusCode,
      );
    }
  }
  
}
