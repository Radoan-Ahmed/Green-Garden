import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/resources/color_res.dart';
import 'package:food_recipe/core/utils/custom_colors.dart';
import 'package:food_recipe/features/common/widget/custom_textfield.dart';
import 'package:food_recipe/features/profile_page/presentation/cubit/getUserInfo_cubit.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  void initState() {
    context.read<GetUserInfoCubit>().getUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorIb.backGroundColor,
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: ColorIb.backGroundColor,
        surfaceTintColor: ColorIb.backGroundColor,
        shadowColor: ColorIb.backGroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 128,
                  width: 128,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset('assets/images/demoImageIcon.png'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Md. Radoan Ahmed",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "riyadradoan@gmail.com",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "01762323232",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                 readOnly: true,
                 hintText: "My address",
                 fillColor: ColorRes.textFieldColor,
              ),
              CustomTextField(
                 readOnly: true,
                 hintText: "About us",
                 fillColor: ColorRes.textFieldColor,
              ),
              CustomTextField(
                 readOnly: true,
                 hintText: "FAQ",
                 fillColor: ColorRes.textFieldColor,
              ),
              CustomTextField(
                 readOnly: true,
                 hintText: "Privacy Policy",
                 fillColor: ColorRes.textFieldColor,
              ),
              CustomTextField(
                 readOnly: true,
                 hintText: "Log out",
                 fillColor: ColorRes.textFieldColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
