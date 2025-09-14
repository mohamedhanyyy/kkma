import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/repository/general_repo.dart';
import '../../../core/cubit/base_cubit_state.dart';
import '../../../services/navigation/navigation.dart';
import '../../../shared/widgets/custom_snack_bar.dart';
import '../screens/verification_screen.dart';

class SendOtpCubit extends Cubit<CubitState> {
  SendOtpCubit() : super(CubitState.initial);

  Future<void> sendOtp(String id) async {
    emit(CubitState.loading);
    final response = await GeneralRepository.sendOtp(id);
    if (response?.statusCode == 200) {
      emit(CubitState.done);
      AppNavigation.navigateReplacement(VerificationScreen(id: id));
    } else {
      emit(CubitState.error);
      CustomSnackBars.showErrorToast(title: "رقم الهوية غير صحيح");
    }
  }
}
