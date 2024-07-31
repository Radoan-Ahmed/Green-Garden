import 'package:flutter/material.dart';
import 'package:food_recipe/features/app.dart';

import 'core/utils/dependency.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Dependency.init();
  runApp(const App());
}


