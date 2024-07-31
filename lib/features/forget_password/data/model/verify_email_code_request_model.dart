// To parse this JSON data, do
//
//     final verifyEmailCodeRequestModel = verifyEmailCodeRequestModelFromJson(jsonString);

import 'dart:convert';

VerifyEmailCodeRequestModel verifyEmailCodeRequestModelFromJson(String str) => VerifyEmailCodeRequestModel.fromJson(json.decode(str));

String verifyEmailCodeRequestModelToJson(VerifyEmailCodeRequestModel data) => json.encode(data.toJson());

class VerifyEmailCodeRequestModel {
    String? email;
    String? code;

    VerifyEmailCodeRequestModel({
        this.email,
        this.code,
    });

    factory VerifyEmailCodeRequestModel.fromJson(Map<String, dynamic> json) => VerifyEmailCodeRequestModel(
        email: json["email"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "code": code,
    };
}
