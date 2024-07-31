import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/navigation/route_name.dart';
import 'package:food_recipe/core/resources/color_res.dart';
import 'package:food_recipe/core/utils/custom_colors.dart';
import 'package:food_recipe/features/common/widget/common_button.dart';
import 'package:food_recipe/features/common/widget/common_error_dialog.dart';
import 'package:food_recipe/features/common/widget/custom_textfield.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/forget_password_validation_cubit/forget_password_validation_cubit.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/reset_password_api_cubit.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  int countClick = 0;
  bool obscureText = true;
  int confirmCountClick = 0;
  bool confirmObscureText = true;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ResetPasswordApiCubit, ResetPasswordApiState>(
          listener: (context, state) {
            if(state is ResetPasswordApiSucceed){
              log("success");
              Navigator.pushNamedAndRemoveUntil(
                    context, RouteName.homeScreen, (route) => false);
            }
            if (state is ResetPasswordApiFailed) {
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
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    const Text(
                      "New Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    CustomTextField(
                      hintText: "Email",
                      onChanged: (value) {
                        context
                            .read<ForgetPasswordValidationCubit>()
                            .changeNewPassEmail(value);
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/emailIcon.png'),
                      ),
                      fillColor: Colors.white,
                    ),
                    CustomTextField(
                      obscureText: obscureText,
                      hintText: "Password",
                      onChanged: (value) {
                        context
                            .read<ForgetPasswordValidationCubit>()
                            .changeNewPass(value);
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/lockIcon.png',
                        ),
                      ),
                      suffixIcon: InkWell(
                        child: Image.asset('assets/images/eyeIcon.png'),
                        onTap: () {
                          if (countClick == 0) {
                            setState(() {});
                            countClick = 1;
                            obscureText = false;
                          } else {
                            setState(() {});
                            countClick = 0;
                            obscureText = true;
                          }
                        },
                      ),
                      fillColor: Colors.white,
                    ),
                    CustomTextField(
                      obscureText: confirmObscureText,
                      hintText: "Confirm Password",
                      onChanged: (value) {
                        context
                            .read<ForgetPasswordValidationCubit>()
                            .changeNewConfirmPass(value);
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/lockIcon.png',
                        ),
                      ),
                      suffixIcon: InkWell(
                        child: Image.asset('assets/images/eyeIcon.png'),
                        onTap: () {
                          if (confirmCountClick == 0) {
                            setState(() {});
                            confirmCountClick = 1;
                            confirmObscureText = false;
                          } else {
                            setState(() {});
                            confirmCountClick = 0;
                            confirmObscureText = true;
                          }
                        },
                      ),
                      fillColor: Colors.white,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Center(
                      child: CommonButton(
                        onTap: () {
                          context
                              .read<ResetPasswordApiCubit>()
                              .resetPasswordApi(
                                  valState.resetPasswordApiRequestModel());
                        },
                        widget: Image.asset("assets/images/buttonIcon.png"),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.23,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("New to GreenGuardian?"),
                        InkWell(
                          onTap: () {
                            log("click");
                            Navigator.pushNamed(
                                context, RouteName.signInScreenRoute);
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorRes.buttonColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
