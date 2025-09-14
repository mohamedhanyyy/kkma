import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkma/core/cubit/base_cubit_state.dart';
import 'package:kkma/modules/repository/cubit/category_details_cubit.dart';
import 'package:kkma/shared/widgets/custom_button.dart';
import 'package:kkma/shared/widgets/custom_loading_widget.dart';
import 'package:kkma/shared/widgets/custom_text_field.dart';

import '../../../core/model/store_items_model.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final StoreItemDetails? item;

  const CategoryDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final rankController =
        TextEditingController(text: item?.id.toString() ?? "");
    final nameController = TextEditingController(text: item?.name ?? "");
    final amountController = TextEditingController(text: item?.barcode ?? "");
    final codeController = TextEditingController(text: item?.code ?? "");

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 32),
              child: Text(item?.name ?? ""),
            ),
            CustomTextField(hintText: 'التصنيف', controller: rankController),
            const SizedBox(height: 24),
            CustomTextField(hintText: 'اسم المادة', controller: nameController),
            const SizedBox(height: 24),
            CustomTextField(hintText: 'العدد', controller: amountController),
            const SizedBox(height: 24),
            CustomTextField(hintText: 'الرمز', controller: codeController),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: BlocBuilder<CategoryDetailsCubit, CubitState>(
          builder: (context, state) {
            if (state == CubitState.loading) {
              return const CustomLoadingButtonWidget();
            }
            return CustomElevatedButton(
              onTap: () {
                context.read<CategoryDetailsCubit>().saveCategoryDetails(
                    rankController.text,
                    nameController.text,
                    amountController.text,
                    codeController.text);
              },
              buttonText: 'حفظ البيانات',
            );
          },
        ),
      ),
    );
  }
}
