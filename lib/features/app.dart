import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_recipe/core/navigation/route_config.dart';
import 'package:food_recipe/core/utils/dependency.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

final routeConfig = RouteConfig();

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // return _buildMaterialApp();
    return MultiBlocProvider(
      providers: Dependency.providers,
      child: _buildMaterialApp(),
    );
  }

   _buildMaterialApp() {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colors.transparent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routeConfig.routes,
      builder: EasyLoading.init(),
    );
  }

}
