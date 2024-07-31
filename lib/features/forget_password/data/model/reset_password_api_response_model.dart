// To parse this JSON data, do
//
//     final resetPasswordApiResponseModel = resetPasswordApiResponseModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordApiResponseModel resetPasswordApiResponseModelFromJson(String str) => ResetPasswordApiResponseModel.fromJson(json.decode(str));

String resetPasswordApiResponseModelToJson(ResetPasswordApiResponseModel data) => json.encode(data.toJson());

class ResetPasswordApiResponseModel {
    int? statusCode;
    bool? success;
    String? message;

    ResetPasswordApiResponseModel({
        this.statusCode,
        this.success,
        this.message,
    });

    factory ResetPasswordApiResponseModel.fromJson(Map<String, dynamic> json) => ResetPasswordApiResponseModel(
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
