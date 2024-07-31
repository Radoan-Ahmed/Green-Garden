// To parse this JSON data, do
//
//     final verifyEmailCodeResponseModel = verifyEmailCodeResponseModelFromJson(jsonString);

import 'dart:convert';

VerifyEmailCodeResponseModel verifyEmailCodeResponseModelFromJson(String str) => VerifyEmailCodeResponseModel.fromJson(json.decode(str));

String verifyEmailCodeResponseModelToJson(VerifyEmailCodeResponseModel data) => json.encode(data.toJson());

class VerifyEmailCodeResponseModel {
    int? statusCode;
    bool? success;
    String? message;

    VerifyEmailCodeResponseModel({
        this.statusCode,
        this.success,
        this.message,
    });

    factory VerifyEmailCodeResponseModel.fromJson(Map<String, dynamic> json) => VerifyEmailCodeResponseModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
    };
}
