import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkma/core/cubit/base_cubit_state.dart';
import 'package:kkma/core/model/get_stores_model.dart';

import '../../../core/repository/general_repo.dart';

class StoresCubit extends Cubit<CubitState> {
  StoresCubit() : super(CubitState.initial);

  GetStoresModel? storesModel;
  Future<void> getStores() async {
    emit(CubitState.loading);
    final response = await GeneralRepository.getStores();
    if (response?.statusCode == 200) {
      storesModel = GetStoresModel.fromJson(response?.data);
      emit(CubitState.done);
    } else {
      emit(CubitState.error);
    }
  }
}
