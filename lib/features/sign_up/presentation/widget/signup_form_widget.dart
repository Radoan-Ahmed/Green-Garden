import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/features/common/widget/custom_textfield.dart';
import 'package:food_recipe/features/sign_up/presentation/cubit/signin_validation_cubit/signin_validation_cubit.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInValidationCubit, SignInValidationState>(
      builder: (context, valState) {
        return Column(
          children: [
            CustomTextField(
              onChanged: (value){
                context.read<SignInValidationCubit>().changeEmail(value);
              },
              hintText: "Email",
              prefixIcon: Image.asset('assets/images/emailIcon.png'),
            ),
            CustomTextField(
              onChanged: (value){
                context.read<SignInValidationCubit>().changeFullName(value);
              },
              hintText: "Full name",
              prefixIcon: Image.asset('assets/images/personIcon.png'),
            ),
            CustomTextField(
              onChanged: (value){
                context.read<SignInValidationCubit>().changePhoneNumber(value);
              },
              hintText: "Phone",
              prefixIcon: Image.asset('assets/images/phoneIcon.png'),
            ),
            CustomTextField(
              onChanged: (value){
                context.read<SignInValidationCubit>().changePassword(value);
              },
              hintText: "Password",
              prefixIcon: Image.asset('assets/images/lockIcon.png'),
            ),
            CustomTextField(
              onChanged: (value){
                context.read<SignInValidationCubit>().changeConfirmPassword(value);
              },
              hintText: "Confirm Password",
              prefixIcon: Image.asset('assets/images/lockIcon.png'),
            ),
            CustomTextField(
              onChanged: (value){
                context.read<SignInValidationCubit>().changeAddress(value);
              },
              hintText: "Address",
              prefixIcon: Image.asset('assets/images/locationIcon.png'),
            ),
          ],
        );
      },
    );
  }
}
