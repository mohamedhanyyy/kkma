import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkma/modules/auth/screens/login_screen.dart';
import 'package:kkma/services/navigation/navigation.dart';
import 'package:kkma/services/shared_preferences/preferences_helper.dart';
import 'package:kkma/shared/functions/general_functions.dart';
import 'package:kkma/shared/themes/app_theme.dart';
import 'app_blocs.dart';

import 'modules/home/presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: GeneralFunctions.hideKeyboard,
          child: MultiBlocProvider(
            providers: appBlocs,
            child: MaterialApp(
              builder: (context, child) => Directionality(
                  textDirection: TextDirection.rtl, child: child!),
              title: 'KKMA',
              theme: AppThemes.whiteTheme,
              locale: const Locale('ar'),
              debugShowCheckedModeBanner: false,
              navigatorKey: AppNavigation.navigatorKey,
              home: CacheHelper.getToken == null
                  ? LoginScreen()
                  : const HomeScreen(),
            ),
          ),
        );
      },
    );
  }
}
