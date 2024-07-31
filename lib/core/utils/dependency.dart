import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/header_provider/header_provider.dart';
import 'package:food_recipe/core/network/connection_checker.dart';
import 'package:food_recipe/features/common/data/data_source/local/token_sorce.dart';
import 'package:food_recipe/features/forget_password/data/remote/reset_password_api_remote.dart';
import 'package:food_recipe/features/forget_password/data/remote/verify_email_code_remote.dart';
import 'package:food_recipe/features/forget_password/data/remote/verify_email_remote.dart';
import 'package:food_recipe/features/forget_password/data/repository_impl/reset_password_api_repository_impl.dart';
import 'package:food_recipe/features/forget_password/data/repository_impl/verify_email_code_repository_impl.dart';
import 'package:food_recipe/features/forget_password/data/repository_impl/verify_email_repository_impl.dart';
import 'package:food_recipe/features/forget_password/domain/repository/reset_password_api_repository.dart';
import 'package:food_recipe/features/forget_password/domain/repository/verify_email_code_repository.dart';
import 'package:food_recipe/features/forget_password/domain/repository/verify_email_repository.dart';
import 'package:food_recipe/features/forget_password/domain/usecase/reset_password_api_usecase.dart';
import 'package:food_recipe/features/forget_password/domain/usecase/verify_email_code_usecase.dart';
import 'package:food_recipe/features/forget_password/domain/usecase/verify_email_usecase.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/forget_password_validation_cubit/forget_password_validation_cubit.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/reset_password_api_cubit.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/verify_email_code_cubit.dart';
import 'package:food_recipe/features/forget_password/presentation/cubit/verify_email_cubit.dart';
import 'package:food_recipe/features/login_page/data/remote/login_remote.dart';
import 'package:food_recipe/features/login_page/data/repository_impl/login_repository_impl.dart';
import 'package:food_recipe/features/login_page/domain/repository/login_repository.dart';
import 'package:food_recipe/features/login_page/domain/usecase/login_usecase.dart';
import 'package:food_recipe/features/login_page/presentation/cubit/login_cubit.dart';
import 'package:food_recipe/features/login_page/presentation/cubit/login_validation_cubit/login_validation_cubit.dart';
import 'package:food_recipe/features/profile_page/data/remote/get_user_info_remote.dart';
import 'package:food_recipe/features/profile_page/data/repository_impl/get_user_info_repository_impl.dart';
import 'package:food_recipe/features/profile_page/domain/repository/get_user_info_repository.dart';
import 'package:food_recipe/features/profile_page/domain/usecase/get_user_info_usecase.dart';
import 'package:food_recipe/features/profile_page/presentation/cubit/getUserInfoValidationCubit/get_user_info_validation_cubit.dart';
import 'package:food_recipe/features/profile_page/presentation/cubit/getUserInfo_cubit.dart';
import 'package:food_recipe/features/sign_up/data/remote/signin_remote.dart';
import 'package:food_recipe/features/sign_up/data/repository_impl/signin_repository_impl.dart';
import 'package:food_recipe/features/sign_up/domain/repository/signin_repository.dart';
import 'package:food_recipe/features/sign_up/domain/usecase/signin_usecase.dart';
import 'package:food_recipe/features/sign_up/presentation/cubit/signin_api_cubit.dart';
import 'package:food_recipe/features/sign_up/presentation/cubit/signin_validation_cubit/signin_validation_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dependency{
  static final sl = GetIt.instance;
  Dependency._init();



  static Future<void> init() async{

    sl.registerFactory(() => LoginValidationCubit());
    sl.registerFactory(() => GetUserInfoValidationCubit());
    sl.registerFactory(() => SignInValidationCubit());
    sl.registerFactory(() => ForgetPasswordValidationCubit());

    sl.registerLazySingleton<HeaderProvider>(() => HeaderProviderImpl());
    sl.registerLazySingleton(() => AuthHeaderProvider(sl()));
     sl.registerLazySingleton<ConnectionChecker>(
      () => ConnectionCheckerImpl(),
    );

    sl.registerLazySingleton<TokenSource>(() => TokenSourceImpl(sl()));
    final sharedPref = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPref);



  
    //.......... log in api cubit .......//

    sl.registerLazySingleton<LoginRemote>(
      () => LoginRemoteImpl(sl()),
    );

    sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerFactory(
        () => LoginCubit(loginUseCase: sl()));

    //................... end ..............//



    //.......... sign in api cubit .......//

    sl.registerLazySingleton<SignInRemote>(
      () => SignInRemoteImpl(sl<HeaderProvider>()),
    );

    sl.registerLazySingleton<SignInRepository>(
      () => SignInRepositoryImpl(
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => SignInUseCase(sl()));
    sl.registerFactory(
        () => SignInApiCubit(signInApiUseCase: sl()));

    //................... end ..............//


    //.......... verify email api cubit .......//

    sl.registerLazySingleton<VerifyEmailRemote>(
      () => VerifyEmailRemoteImpl(sl<HeaderProvider>()),
    );

    sl.registerLazySingleton<VerifyEmailRepository>(
      () => VerifyEmailRepositoryImpl(
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => VerifyEmailUseCase(sl()));
    sl.registerFactory(
        () => VerifyEmailCubit(verifyEmailUseCase: sl()));

    //................... end ..............//

    //.......... verify email code api cubit .......//

    sl.registerLazySingleton<VerifyEmailCodeRemote>(
      () => VerifyEmailCodeRemoteImpl(sl<HeaderProvider>()),
    );

    sl.registerLazySingleton<VerifyEmailCodeRepository>(
      () => VerifyEmailCodeRepositoryImpl(
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => VerifyEmailCodeUseCase(sl()));
    sl.registerFactory(
        () => VerifyEmailCodeCubit(verifyEmailUseCase: sl()));

    //................... end ..............//


    //.......... verify email code api cubit .......//

    sl.registerLazySingleton<ResetPasswordApiRemote>(
      () => ResetPasswordApiRemoteImpl(sl<HeaderProvider>()),
    );

    sl.registerLazySingleton<ResetPasswordApiRepository>(
      () => ResetPasswordApiRepositoryImpl(
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => ResetPasswordApiUseCase(sl()));
    sl.registerFactory(
        () => ResetPasswordApiCubit(resetPasswordApiUseCase: sl()));

    //................... end ..............//



    //.......... Get use info api cubit .......//

    sl.registerLazySingleton<GetUserInfoRemote>(
      () => GetUserInfoRemoteImpl(sl<AuthHeaderProvider>()),
    );

    sl.registerLazySingleton<GetUserInfoRepository>(
      () => GetUserInfoRepositoryImpl(
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => GetUserInfoUseCase(sl()));
    sl.registerFactory(
        () => GetUserInfoCubit(getUserInfoUseCase: sl()));

    //................... end ..............//




  }
  
  static final providers = <BlocProvider>[
    BlocProvider<LoginCubit>(
      create: (context) => Dependency.sl<LoginCubit>(),
    ),

  ];

}