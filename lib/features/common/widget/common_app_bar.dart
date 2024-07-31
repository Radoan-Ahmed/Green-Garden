import 'package:flutter/material.dart';
import 'package:food_recipe/core/utils/custom_colors.dart';

class CommonAppBar extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  const CommonAppBar({
    required this.text,
    this.backgroundColor,
    this.surfaceTintColor,
    this.shadowColor,
    super.key});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
        title: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor:backgroundColor ??ColorIb.backGroundColor,
        surfaceTintColor: surfaceTintColor ?? ColorIb.backGroundColor,
        shadowColor: shadowColor ?? ColorIb.backGroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black, // Set back button icon color to black
        ),
      );
  }
}