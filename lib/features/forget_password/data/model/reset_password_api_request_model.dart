// To parse this JSON data, do
//
//     final resetPasswordApiRequestModel = resetPasswordApiRequestModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordApiRequestModel resetPasswordApiRequestModelFromJson(String str) => ResetPasswordApiRequestModel.fromJson(json.decode(str));

String resetPasswordApiRequestModelToJson(ResetPasswordApiRequestModel data) => json.encode(data.toJson());

class ResetPasswordApiRequestModel {
    String? email;
    String? password;
    String? confirmPassword;

    ResetPasswordApiRequestModel({
        this.email,
        this.password,
        this.confirmPassword,
    });

    factory ResetPasswordApiRequestModel.fromJson(Map<String, dynamic> json) => ResetPasswordApiRequestModel(
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
    };
}
