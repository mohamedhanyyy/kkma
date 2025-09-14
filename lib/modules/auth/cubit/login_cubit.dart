import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkma/core/repository/general_repo.dart';
import 'package:kkma/modules/auth/screens/verification_done_screen.dart';
import 'package:kkma/services/navigation/navigation.dart';
import '../../../core/cubit/base_cubit_state.dart';
import '../../../services/shared_preferences/preferences_helper.dart';
import '../../../shared/model/user_model.dart';
import '../../../shared/widgets/custom_snack_bar.dart';

class LoginCubit extends Cubit<CubitState> {
  LoginCubit() : super(CubitState.initial);

  Future<void> login(String id, String otp) async {
    emit(CubitState.loading);
    final response = await GeneralRepository.login(id, otp);
    if (response.runtimeType == UserModel) {
      CacheHelper.saveName(name: 'mohamed hany');
      CacheHelper.saveToken(token: response!.data!.authToken!);
      CacheHelper.saveRefreshToken(refreshToken: response.data!.refreshTokenId!);
      emit(CubitState.done);
      AppNavigation.navigateOffAll(const VerificationDoneScreen());
    } else {
      emit(CubitState.error);
      CustomSnackBars.showErrorToast(title: "رمز خاطئ");
    }
  }
}
