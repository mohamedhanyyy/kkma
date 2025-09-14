import 'package:flutter/material.dart';
import 'package:kkma/services/shared_preferences/preferences_helper.dart';
import 'package:kkma/shared/functions/general_functions.dart';
import 'kkma_app.dart';
import 'shared/functions/restart_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GeneralFunctions.setPreferredOrientation();
  await CacheHelper.init();
  runApp(const RestartWidget(child: MyApp()));
}
