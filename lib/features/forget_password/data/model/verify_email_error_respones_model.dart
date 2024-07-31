// To parse this JSON data, do
//
//     final verifyEmailErrorResponseModel = verifyEmailErrorResponseModelFromJson(jsonString);

import 'dart:convert';

VerifyEmailErrorResponseModel verifyEmailErrorResponseModelFromJson(String str) => VerifyEmailErrorResponseModel.fromJson(json.decode(str));

String verifyEmailErrorResponseModelToJson(VerifyEmailErrorResponseModel data) => json.encode(data.toJson());

class VerifyEmailErrorResponseModel {
    int? statusCode;
    bool? success;
    String? message;
    List<ErrorMessage>? errorMessages;
    String? stack;

    VerifyEmailErrorResponseModel({
        this.statusCode,
        this.success,
        this.message,
        this.errorMessages,
        this.stack,
    });

    factory VerifyEmailErrorResponseModel.fromJson(Map<String, dynamic> json) => VerifyEmailErrorResponseModel(
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
