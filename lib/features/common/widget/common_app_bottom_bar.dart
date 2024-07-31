// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/core/resources/color_res.dart';

class CommonAppBottomBar extends StatelessWidget {
  final Function(int) onTap;
  final List<IconData>? iconList;
  final int currentIndex;

   const CommonAppBottomBar({
    required this.onTap,
    this.iconList,
    required this.currentIndex,
    super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconData> _iconList = [
    Icons.home,
    Icons.category,
    Icons.fitbit_rounded,
    Icons.book,
    Icons.person, 
  ];

    return AnimatedBottomNavigationBar(
        gapLocation: GapLocation.none,
        backgroundColor: ColorRes.textFieldColor,
        icons: iconList??_iconList,
        activeIndex: currentIndex,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: onTap,
      );
  }
}