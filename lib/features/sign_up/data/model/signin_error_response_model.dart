// To parse this JSON data, do
//
//     final signInErrorResponseModel = signInErrorResponseModelFromJson(jsonString);

import 'dart:convert';

SignInErrorResponseModel signInErrorResponseModelFromJson(String str) => SignInErrorResponseModel.fromJson(json.decode(str));

String signInErrorResponseModelToJson(SignInErrorResponseModel data) => json.encode(data.toJson());

class SignInErrorResponseModel {
    int? statusCode;
    bool? success;
    String? message;
    List<ErrorMessage>? errorMessages;
    String? stack;

    SignInErrorResponseModel({
        this.statusCode,
        this.success,
        this.message,
        this.errorMessages,
        this.stack,
    });

    factory SignInErrorResponseModel.fromJson(Map<String, dynamic> json) => SignInErrorResponseModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        errorMessages: json["errorMessages"] == null ? [] : List<ErrorMessage>.from(json["errorMessages"]!.map((x) => ErrorMessage.fromJson(x))),
        stack: json["stack"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "errorMessages": errorMessages == null ? [] : List<dynamic>.from(errorMessages!.map((x) => x.toJson())),
        "stack": stack,
    };
}

class ErrorMessage {
    String? path;
    String? message;

    ErrorMessage({
        this.path,
        this.message,
    });

    factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
        path: json["path"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
        "message": message,
    };
}
