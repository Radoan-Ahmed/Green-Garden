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
import 'package:food_recipe/features/login_page/presentation/cubit/login_cubit.dart';
import 'package:food_recipe/features/login_page/presentation/cubit/login_validation_cubit/login_validation_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int countClick = 0;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorIb.backGroundColor,
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSucceed) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteName.homeScreen, (route) => false);
              }
              if (state is LoginFailed) {
                final ex = state.exception;
                if (ex is ServerException) {
                  showErrorDialog(
                      context, ex.message.toString(), "Login Error!");
                }
              }
            },
          ),
        ],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<LoginValidationCubit, LoginValidationState>(
              builder: (context, valState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    const Text(
                      "Login",
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
                        context.read<LoginValidationCubit>().changeEmail(value);
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
                            .read<LoginValidationCubit>()
                            .changePassword(value);
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
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  RouteName.verifyScreen, (route) => false);
                            },
                            child: const Text(
                              "forget Password!",
                              style: TextStyle(color: ColorRes.buttonColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Center(
                      child: CommonButton(
                        onTap: () {
                          context
                              .read<LoginCubit>()
                              .login(valState.loginRequestModel());
                          log("click here");
                        },
                        widget: Image.asset("assets/images/buttonIcon.png"),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
