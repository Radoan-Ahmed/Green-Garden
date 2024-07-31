import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/navigation/route_name.dart';
import 'package:food_recipe/core/utils/custom_colors.dart';
import 'package:food_recipe/features/common/widget/common_button.dart';
import 'package:food_recipe/features/common/widget/common_error_dialog.dart';
import 'package:food_recipe/features/common/widget/custom_textfield.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/forget_password_validation_cubit/forget_password_validation_cubit.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/verify_email_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<VerifyEmailCubit, VerifyEmailState>(
          listener: (context, state) {
            if(state is VerifyEmailSucceed){
              Navigator.pushNamed(context, RouteName.verifyCodeScreen);
            }
            else if(state is VerifyEmailFailed){
              // Navigator.pushNamed(context, RouteName.verifyCodeScreen);
              final ex = state.exception;
              if(ex is ServerException){
              showErrorDialog(context, ex.message.toString(), "Verify Failed!" );
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
                  CustomTextField(
                    onChanged: (value) async{
                      context
                          .read<ForgetPasswordValidationCubit>()
                          .changeEmail(value);
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("email", value);
                    },
                    hintText: "Enter you mail",
                    prefixIcon: Image.asset('assets/images/emailIcon.png'),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CommonButton(
                      onTap: () {
                        context
                            .read<VerifyEmailCubit>()
                            .verifyEmail(valState.verifyEmailRequestModel());
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
}
