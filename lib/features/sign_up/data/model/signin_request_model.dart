// To parse this JSON data, do
//
//     final signInRequestModel = signInRequestModelFromJson(jsonString);

import 'dart:convert';

SignInRequestModel signInRequestModelFromJson(String str) => SignInRequestModel.fromJson(json.decode(str));

String signInRequestModelToJson(SignInRequestModel data) => json.encode(data.toJson());

class SignInRequestModel {
    String? email;
    String? fullName;
    String? phone;
    String? password;
    String? confirmPassword;
    String? address;

    SignInRequestModel({
        this.email,
        this.fullName,
        this.phone,
        this.password,
        this.confirmPassword,
        this.address,
    });

    factory SignInRequestModel.fromJson(Map<String, dynamic> json) => SignInRequestModel(
        email: json["email"],
        fullName: json["fullName"],
        phone: json["phone"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "fullName": fullName,
        "phone": phone,
        "password": password,
        "confirmPassword": confirmPassword,
        "address": address,
    };
}
