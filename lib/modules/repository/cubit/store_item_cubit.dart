import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkma/core/cubit/base_cubit_state.dart';

import '../../../core/model/store_items_model.dart';
import '../../../core/repository/general_repo.dart';

class StoreItemCubit extends Cubit<CubitState> {
  StoreItemCubit() : super(CubitState.initial);

  clearItem() {
    storeItemsModel = null;
    emit(CubitState.initial);
  }

  StoreItemsModel? storeItemsModel;
  Future<void> getStoreItemCubit(storeId, term) async {
    emit(CubitState.loading);
    final response = await GeneralRepository.getStoreItems(storeId, term);
    if (response?.statusCode == 200) {
      storeItemsModel = StoreItemsModel.fromJson(response?.data);
      if (storeItemsModel?.storeItems?.isEmpty == true) {
        emit(CubitState.empty);
      } else {
        emit(CubitState.done);
      }
    } else {
      emit(CubitState.error);
    }
  }
}
