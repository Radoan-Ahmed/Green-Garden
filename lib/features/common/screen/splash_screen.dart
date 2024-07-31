import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/core/constant/api_config.dart';
import 'package:food_recipe/core/navigation/route_name.dart';
import 'package:food_recipe/core/utils/custom_colors.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  getIndexValue() async {
    ApiConfig.init(
      serverConfig: "",
    );
  }
  
  @override
  void initState() {
    
    getIndexValue();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/splashAnimation.json'),
          const Text(
            "GreenGuardian",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      )),
      nextScreen: Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context)
                .pushReplacementNamed(RouteName.loginScreenRoute);
          });
          return Container();
        },
      ),
      duration: 3000,
      splashIconSize: double.infinity,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: ColorIb.backGroundColor,
    );
  }
}
