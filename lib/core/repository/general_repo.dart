import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/const/api_consts.dart';
import '../../../../services/dio_helper/dio_helper.dart';
import '../../../../services/dio_helper/error_handler.dart';
import '../../../../services/shared_preferences/preferences_helper.dart';
import '../../../../shared/model/user_model.dart';
import '../../../../shared/widgets/custom_snack_bar.dart';

class GeneralRepository {
  static Future<Response?> sendOtp(String id) async {
    final response =
        await DioHelper.postLoginData(url: EndPoints.sendOTP, data: {
      'nationalId': id,
      'userCategory': 6791,
    });
    if (response?.statusCode == 200) {
      CustomSnackBars.showSuccessToast(title: 'تم إرسال رمز التحقق بنجاح');
      return response;
    } else {
      errorHandler(response);
    }
    return null;
  }

  static Future<UserModel?> login(String nationalId, String otp) async {
    final response = await DioHelper.postLoginData(url: EndPoints.login, data: {
      'nationalId': nationalId,
      'otp': otp,
      "firebase_token": 'hello',
      "device_name": Platform.isIOS ? 'ios' : 'android',
    });
    if (response?.statusCode == 200) {
      final user = UserModel.fromJson(response?.data);
      return user;
    }
    return null;
  }

  static generateNewToken() async {
    final response =
        await DioHelper.postData(url: EndPoints.refreshToken, data: {
      'ExpiredToken': CacheHelper.getToken,
      'refreshTokenId': CacheHelper.getRefreshToken,
    });

    if (response?.statusCode == 200) {
      final user = UserModel.fromJson(response?.data);
      CacheHelper.saveToken(token: user.data!.authToken!);
      CacheHelper.saveRefreshToken(refreshToken: user.data!.refreshTokenId!);
    } else {
      errorHandler(response);
    }
  }

  static Future<Response?> getStores() async {
    final response = await DioHelper.getData(url: EndPoints.getStores);

    if (response?.statusCode == 200) {
      return response;
    } else {
      errorHandler(response);
    }
    return null;
  }

  static Future<Response?> getStoreItems(storeId, term) async {
    final response =
        await DioHelper.getData(url: EndPoints.getStoreItems, query: {
      'storeId': storeId,
      'term': term,
    });

    if (response?.statusCode == 200) {
      return response;
    } else {
      errorHandler(response);
    }
    return null;
  }

  static Future<Response?> saveCategoryDetails(rank, name, quant, code) async {
    final response = await DioHelper.getData(
        url: '',
        query: {'rank': rank, 'name': name, 'quant': quant, 'code': code});

    if (response?.statusCode == 200) {
      return response;
    } else {
      errorHandler(response);
    }
    return null;
  }
}
