import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_recipe/core/exceptions/exceptions.dart';
import 'package:food_recipe/core/navigation/route_name.dart';
import 'package:food_recipe/core/resources/color_res.dart';
import 'package:food_recipe/core/utils/custom_colors.dart';
import 'package:food_recipe/features/common/widget/common_button.dart';
import 'package:food_recipe/features/sign_up/data/model/signin_error_response_model.dart';
import 'package:food_recipe/features/sign_up/presentation/cubit/signin_api_cubit.dart';
import 'package:food_recipe/features/sign_up/presentation/cubit/signin_validation_cubit/signin_validation_cubit.dart';
import 'package:food_recipe/features/sign_up/presentation/widget/profile_image_widget.dart';
import 'package:food_recipe/features/sign_up/presentation/widget/signup_form_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInErrorResponseModel? res;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorIb.backGroundColor,
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: ColorIb.backGroundColor,
        surfaceTintColor: ColorIb.backGroundColor,
        shadowColor: ColorIb.backGroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: BlocListener<SignInApiCubit, SignInApiState>(
        listener: (context, state) {
          if(state is SignInApiSucceed){
            print("api success");
          }
          else if(state is SignInApiFailed){
           
             final ex = state.exception;
              if (ex is ServerException) {
                Fluttertoast.showToast(msg: "${ex.message}");
              } else if (ex is NoInternetException) {
                Fluttertoast.showToast(msg: "No Internet");
              }
            
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<SignInValidationCubit, SignInValidationState>(
              builder: (context, valState) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const ProfileImageWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      const SignUpFormWidget(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                "By signing up, you are agree to our terms & condition"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: CommonButton(
                            onTap: () {
                              context.read<SignInApiCubit>().signInApi(valState.signInRequestModel());
                            },
                            widget: Image.asset('assets/images/buttonIcon.png')),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Join us before?"),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    RouteName.loginScreenRoute, (route) => false);
                                // Navigator.pushNamed(context, RouteName.loginScreenRoute);
                              },
                              child: const Text(
                                " Sign in",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorRes.buttonColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
