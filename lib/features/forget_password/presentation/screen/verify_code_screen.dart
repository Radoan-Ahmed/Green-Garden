import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/navigation/route_name.dart';
import 'package:food_recipe/core/utils/custom_colors.dart';
import 'package:food_recipe/features/common/widget/common_button.dart';
import 'package:food_recipe/features/common/widget/common_error_dialog.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/forget_password_validation_cubit/forget_password_validation_cubit.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/verify_email_code_cubit.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  void initState() {
    context.read<ForgetPasswordValidationCubit>().getSaveEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<VerifyEmailCodeCubit, VerifyEmailCodeState>(
          listener: (context, state) {
            if (state is VerifyEmailCodeSucceed) {
              log("success");
              Navigator.pushNamed(context, RouteName.newPasswordScreen);
            }
            if (state is VerifyEmailCodeFailed) {
              // Navigator.pushNamed(context, RouteName.newPasswordScreen);
              final ex = state.exception;
              if(ex is ServerException){
                showErrorDialog(context, ex.message.toString(), "Verify Code Failed!");
              }
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorIb.backGroundColor,
        body: BlocBuilder<ForgetPasswordValidationCubit,
            ForgetPasswordValidationState>(
          builder: (context, valState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Verify Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      "Please enter your email, which was use to create account",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  _buildOtpTextField(),
                  // _buildCodeField(),
                  const SizedBox(
                    height: 60,
                  ),
                  CommonButton(
                      onTap: () {
                        context.read<VerifyEmailCodeCubit>().verifyEmail(
                            valState.verifyEmailCodeRequestModel());
                      },
                      widget: Image.asset('assets/images/buttonIcon.png'))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOtpTextField() {
    return OTPTextField(
      length: 4,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 40,
      style: const TextStyle(fontSize: 17),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {
        context.read<ForgetPasswordValidationCubit>().changeOtpCode(pin);
      },
    );
  }

  
}
