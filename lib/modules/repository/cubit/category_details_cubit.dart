import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkma/core/cubit/base_cubit_state.dart';
import 'package:kkma/shared/widgets/custom_success_dialog.dart';

import '../../../core/repository/general_repo.dart';

class CategoryDetailsCubit extends Cubit<CubitState> {
  CategoryDetailsCubit() : super(CubitState.initial);

  Future<void> saveCategoryDetails(rank, name, quant, code) async {
    emit(CubitState.loading);
    final response =
        await GeneralRepository.saveCategoryDetails(rank, name, quant, code);
    if (response?.statusCode == 200) {
      AppDialog.showSuccessPopup();
      emit(CubitState.done);
    } else {

      AppDialog.showErrorPopup('error', 'error');

      emit(CubitState.error);
    }
  }
}
