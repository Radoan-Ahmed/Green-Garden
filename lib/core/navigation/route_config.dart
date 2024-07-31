import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/utils/dependency.dart';
import 'package:food_recipe/features/common/screen/splash_screen.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/forget_password_validation_cubit/forget_password_validation_cubit.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/reset_password_api_cubit.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/verify_email_code_cubit.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/verify_email_cubit.dart';
import 'package:food_recipe/features/forget_password/presentation/screen/new_password_screen.dart';
import 'package:food_recipe/features/forget_password/presentation/screen/verify_code_screen.dart';
import 'package:food_recipe/features/forget_password/presentation/screen/verify_screen.dart';
import 'package:food_recipe/features/home_page/presentation/screen/home_screen.dart';
import 'package:food_recipe/features/login_page/presentation/cubit/login_cubit.dart';
import 'package:food_recipe/features/login_page/presentation/screen/login_screen.dart';
import 'package:food_recipe/features/profile_page/presentation/cubit/getUserInfoValidationCubit/get_user_info_validation_cubit.dart';
import 'package:food_recipe/features/profile_page/presentation/cubit/getUserInfo_cubit.dart';
import 'package:food_recipe/features/sign_up/presentation/cubit/signin_api_cubit.dart';
import 'package:food_recipe/features/sign_up/presentation/cubit/signin_validation_cubit/signin_validation_cubit.dart';
import 'package:food_recipe/features/sign_up/presentation/screen/signin_screen.dart';

import '../../features/login_page/presentation/cubit/login_validation_cubit/login_validation_cubit.dart';
import 'route_name.dart';

class RouteConfig {
  Route routes(RouteSettings routeSettings) {
    
    switch (routeSettings.name) {
      case RouteName.initialRoute:
        return _getInitialRoute();
      case RouteName.loginScreenRoute:
       return _getLoginScreenRoute();
      case RouteName.signInScreenRoute:
       return _getSignInScreenRoute();
      case RouteName.verifyScreen:
       return _getVerifyScreenRoute();
      case RouteName.verifyCodeScreen:
       return _getVerifyCodeScreenRoute();
      case RouteName.homeScreen:
       return _getHomeScreenRoute();
      case RouteName.newPasswordScreen:
       return _getNewPasswordScreenRoute();
    }
    return _defaultRoute();
  }

  static MaterialPageRoute _routeBuilder(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }

  static MaterialPageRoute _defaultRoute() {
    return _routeBuilder(
      const Scaffold(
        body: Center(
          child: Text('Unknown route'),
        ),
      ),
    );
  }

  static MaterialPageRoute _getInitialRoute() {
    return _routeBuilder(const SplashScreen());
  }

  // static MaterialPageRoute _getLoginScreenRoute() {
  //   return _routeBuilder(const LoginScreen());
  // }
  static MaterialPageRoute _getLoginScreenRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: RouteName.initialRoute),
        builder: (context) {
          return MultiBlocProvider(providers: [
            
            BlocProvider<LoginValidationCubit>(
              create: (context) =>
                  Dependency.sl<LoginValidationCubit>(),
            ),
            BlocProvider<LoginCubit>(
              create: (context) =>
                  Dependency.sl<LoginCubit>(),
            ),
            
          ], child:const LoginScreen());
        });
  }

  static MaterialPageRoute _getSignInScreenRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: RouteName.initialRoute),
        builder: (context) {
          return MultiBlocProvider(providers: [
            
            BlocProvider<SignInValidationCubit>(
              create: (context) =>
                  Dependency.sl<SignInValidationCubit>(),
            ),
            BlocProvider<SignInApiCubit>(
              create: (context) =>
                  Dependency.sl<SignInApiCubit>(),
            ),
            
          ], child:const SignInScreen());
        });
  }

  static MaterialPageRoute _getVerifyScreenRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: RouteName.initialRoute),
        builder: (context) {
          return MultiBlocProvider(providers: [
            
            BlocProvider<SignInValidationCubit>(
              create: (context) =>
                  Dependency.sl<SignInValidationCubit>(),
            ),
            BlocProvider<SignInApiCubit>(
              create: (context) =>
                  Dependency.sl<SignInApiCubit>(),
            ),
            BlocProvider<VerifyEmailCubit>(
              create: (context) =>
                  Dependency.sl<VerifyEmailCubit>(),
            ),
            BlocProvider<ForgetPasswordValidationCubit>(
              create: (context) =>
                  Dependency.sl<ForgetPasswordValidationCubit>(),
            ),
            
          ], child:const VerifyScreen());
        });
  }

  // static MaterialPageRoute _getSignInScreenRoute() {
  //   return _routeBuilder(const SignInScreen());
  // }



//.............................. end ................................//


//..................................... verify code screen start...............................//

  static MaterialPageRoute _getVerifyCodeScreenRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: RouteName.initialRoute),
        builder: (context) {
          return MultiBlocProvider(providers: [
            
            BlocProvider<SignInValidationCubit>(
              create: (context) =>
                  Dependency.sl<SignInValidationCubit>(),
            ),
            BlocProvider<SignInApiCubit>(
              create: (context) =>
                  Dependency.sl<SignInApiCubit>(),
            ),
            BlocProvider<VerifyEmailCubit>(
              create: (context) =>
                  Dependency.sl<VerifyEmailCubit>(),
            ),
            BlocProvider<ForgetPasswordValidationCubit>(
              create: (context) =>
                  Dependency.sl<ForgetPasswordValidationCubit>(),
            ),
            BlocProvider<VerifyEmailCodeCubit>(
              create: (context) =>
                  Dependency.sl<VerifyEmailCodeCubit>(),
            ),
            
          ], child:const VerifyCodeScreen());
        });
  }


//............................................ code ................................................//



//..................................... verify code screen start...............................//

  static MaterialPageRoute _getHomeScreenRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: RouteName.homeScreen),
        builder: (context) {
          return MultiBlocProvider(providers: [
            
            BlocProvider<SignInValidationCubit>(
              create: (context) =>
                  Dependency.sl<SignInValidationCubit>(),
            ),
            BlocProvider<SignInApiCubit>(
              create: (context) =>
                  Dependency.sl<SignInApiCubit>(),
            ),
            BlocProvider<VerifyEmailCubit>(
              create: (context) =>
                  Dependency.sl<VerifyEmailCubit>(),
            ),
            BlocProvider<ForgetPasswordValidationCubit>(
              create: (context) =>
                  Dependency.sl<ForgetPasswordValidationCubit>(),
            ),
            BlocProvider<VerifyEmailCodeCubit>(
              create: (context) =>
                  Dependency.sl<VerifyEmailCodeCubit>(),
            ),
            BlocProvider<LoginCubit>(
              create: (context) =>
                  Dependency.sl<LoginCubit>(),
            ),
            BlocProvider<LoginValidationCubit>(
              create: (context) =>
                  Dependency.sl<LoginValidationCubit>(),
            ),
            BlocProvider<GetUserInfoCubit>(
              create: (context) =>
                  Dependency.sl<GetUserInfoCubit>(),
            ),
            BlocProvider<GetUserInfoValidationCubit>(
              create: (context) =>
                  Dependency.sl<GetUserInfoValidationCubit>(),
            ),
            
          ], child:HomeScreen());
        });
  }


//............................................ code ................................................//



//..................................... verify code screen start...............................//

  static MaterialPageRoute _getNewPasswordScreenRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: RouteName.newPasswordScreen),
        builder: (context) {
          return MultiBlocProvider(providers: [
            
            BlocProvider<SignInValidationCubit>(
              create: (context) =>
                  Dependency.sl<SignInValidationCubit>(),
            ),
            BlocProvider<SignInApiCubit>(
              create: (context) =>
                  Dependency.sl<SignInApiCubit>(),
            ),
            BlocProvider<VerifyEmailCubit>(
              create: (context) =>
                  Dependency.sl<VerifyEmailCubit>(),
            ),
            BlocProvider<ForgetPasswordValidationCubit>(
              create: (context) =>
                  Dependency.sl<ForgetPasswordValidationCubit>(),
            ),
            BlocProvider<VerifyEmailCodeCubit>(
              create: (context) =>
                  Dependency.sl<VerifyEmailCodeCubit>(),
            ),
            BlocProvider<ResetPasswordApiCubit>(
              create: (context) =>
                  Dependency.sl<ResetPasswordApiCubit>(),
            ),
            
          ], child:const NewPasswordScreen());
        });
  }


//............................................ code ................................................//




}

