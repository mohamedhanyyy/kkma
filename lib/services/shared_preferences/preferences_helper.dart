
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/auth/screens/login_screen.dart';
import '../navigation/navigation.dart';

class CacheHelper {
  static late SharedPreferences preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken({required String token}) async {
    await preferences.setString('token', token);
  }

  static String? get getToken {
    return preferences.getString('token');
  }


  static Future<void> saveName({required String name}) async {
    await preferences.setString('name', name);
  }

  static String? get getName {
    return preferences.getString('name');
  }

  static Future<void> saveRefreshToken({required String refreshToken}) async {
    await preferences.setString('refreshToken', refreshToken);
  }

  static String? get getRefreshToken {
    return preferences.getString('refreshToken');
  }

  static Future<void> logOut() async {
  await  preferences.clear();
    AppNavigation.navigateOffAll(LoginScreen());
  }
}
