// To parse this JSON data, do
//
//     final getUserInfoResponseModel = getUserInfoResponseModelFromJson(jsonString);

import 'dart:convert';

GetUserInfoResponseModel getUserInfoResponseModelFromJson(String str) => GetUserInfoResponseModel.fromJson(json.decode(str));

String getUserInfoResponseModelToJson(GetUserInfoResponseModel data) => json.encode(data.toJson());

class GetUserInfoResponseModel {
    int? statusCode;
    bool? success;
    String? message;
    Data? data;

    GetUserInfoResponseModel({
        this.statusCode,
        this.success,
        this.message,
        this.data,
    });

    factory GetUserInfoResponseModel.fromJson(Map<String, dynamic> json) => GetUserInfoResponseModel(
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
    String? id;
    String? email;
    String? role;
    String? phone;

    Data({
        this.id,
        this.email,
        this.role,
        this.phone,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        role: json["role"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "role": role,
        "phone": phone,
    };
}
