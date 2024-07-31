import 'dart:convert';
import 'dart:developer';

import 'package:food_recipe/core/constant/api_constans.dart';
import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/header_provider/header_provider.dart';
import 'package:food_recipe/features/common/data/model/common_error_response_model.dart';
import 'package:food_recipe/features/forget_password/data/model/reset_password_api_request_model.dart';
import 'package:food_recipe/features/forget_password/data/model/reset_password_api_response_model.dart';
import 'package:http/http.dart' as http;

abstract class ResetPasswordApiRemote {
  Future<ResetPasswordApiResponseModel> resetPasswordApi(ResetPasswordApiRequestModel resetPasswordApiRequestModel);
}

class ResetPasswordApiRemoteImpl implements ResetPasswordApiRemote{
  static String resetPasswordApiEndpoint = ApiConstants.baseCommonApiVersionOne+ApiConstants.resetPasswordApiUrl;
  final HeaderProvider _headerProvider;

  ResetPasswordApiRemoteImpl(this._headerProvider);
  var url = Uri.parse(resetPasswordApiEndpoint);

  @override
  Future<ResetPasswordApiResponseModel> resetPasswordApi(ResetPasswordApiRequestModel resetPasswordApiRequestModel) async{
    ResetPasswordApiResponseModel res;
    CommonErrorResponseModel errorRes;
    final headers = _headerProvider();
    final response = await http.post(url,
    body: json.encode(resetPasswordApiRequestModel),
    headers: headers);
    log("the request : ${json.encode(resetPasswordApiRequestModel)}");
      // print("the response is :${json.encode(response)}");
    if(response.statusCode == 200){
      res = resetPasswordApiResponseModelFromJson(utf8.decode(response.bodyBytes));
      log("the response is :${json.encode(res)}");
      return res;
    }else{
      errorRes = commonErrorResponseModelFromJson(utf8.decode(response.bodyBytes));
      log("the error response is :${json.encode(errorRes)}");
      throw ServerException(
        message: errorRes.message,
        statusCode: errorRes.statusCode,
      );
    }
  }
  
}
