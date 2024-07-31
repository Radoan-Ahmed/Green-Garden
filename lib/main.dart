import 'package:flutter/material.dart';
import 'package:food_recipe/features/app.dart';

import 'core/utils/dependency.dart';

void main() {
  Dependency.init();
  runApp(const App());
}


