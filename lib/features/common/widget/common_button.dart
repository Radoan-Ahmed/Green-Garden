import 'package:flutter/material.dart';
import 'package:food_recipe/core/resources/color_res.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final bool isDisabled;
  final Color? color;
  final Widget widget;

  const CommonButton({
    Key? key,
    this.onTap,
    this.padding,
    this.isDisabled = false,
    this.color,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: MediaQuery.of(context).size.height*.05,
        width: MediaQuery.of(context).size.width*.45,
        // padding: padding ??
        //     const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
            color: isDisabled
                ? color ?? ColorRes.kButtonBG.withOpacity(0.5)
                : color ?? ColorRes.buttonColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(child: widget),
      ),
    );
  }
}
