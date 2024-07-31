// To parse this JSON data, do
//
//     final verifyEmailResponseModel = verifyEmailResponseModelFromJson(jsonString);

import 'dart:convert';

VerifyEmailResponseModel verifyEmailResponseModelFromJson(String str) => VerifyEmailResponseModel.fromJson(json.decode(str));

String verifyEmailResponseModelToJson(VerifyEmailResponseModel data) => json.encode(data.toJson());

class VerifyEmailResponseModel {
    int? statusCode;
    bool? success;
    String? message;
    Data? data;

    VerifyEmailResponseModel({
        this.statusCode,
        this.success,
        this.message,
        this.data,
    });

    factory VerifyEmailResponseModel.fromJson(Map<String, dynamic> json) => VerifyEmailResponseModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    DateTime? expiredAt;

    Data({
        this.expiredAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        expiredAt: json["expiredAt"] == null ? null : DateTime.parse(json["expiredAt"]),
    );

    Map<String, dynamic> toJson() => {
        "expiredAt": expiredAt?.toIso8601String(),
    };
}
