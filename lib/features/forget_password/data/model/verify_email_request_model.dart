// To parse this JSON data, do
//
//     final verifyEmailRequestModel = verifyEmailRequestModelFromJson(jsonString);

import 'dart:convert';

VerifyEmailRequestModel verifyEmailRequestModelFromJson(String str) => VerifyEmailRequestModel.fromJson(json.decode(str));

String verifyEmailRequestModelToJson(VerifyEmailRequestModel data) => json.encode(data.toJson());

class VerifyEmailRequestModel {
    String? email;

    VerifyEmailRequestModel({
        this.email,
    });

    factory VerifyEmailRequestModel.fromJson(Map<String, dynamic> json) => VerifyEmailRequestModel(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}
