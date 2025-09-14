import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pinput/pinput.dart';

import '../../../core/cubit/base_cubit_state.dart';
import '../../../core/resources/colors.dart';
import '../../../shared/widgets/bubble_widget.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_loading_widget.dart';
import '../cubit/login_cubit.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key, required this.id});
  final String id;

  final controller = TextEditingController(
      // text: kDebugMode ? '1111' : null
      );

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BubbleWidget(),
            Image.asset('assets/images/logo.png',
                color: AppColors.primaryColor),
            const SizedBox(height: 26),
            const Text(
              "ادخل رمز التحقق",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "تم إرسال رمز التحقق المكوَّن من 4 أرقام إليك",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  autofocus: true,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  focusedPinTheme: PinTheme(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.primaryColor))),
                  defaultPinTheme: PinTheme(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.primaryColor
                                  .withValues(alpha: 0.3)))),
                  controller: controller,
                  length: 4,
                  validator: (val) {
                    if (val?.isEmpty == true || val!.length < 4) {
                      return 'برجاء ادخال رمز التحقق';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<LoginCubit, CubitState>(builder: (context, state) {
              if (state == CubitState.loading) {
                return const CustomLoadingButtonWidget();
              }
              return CustomElevatedButton(
                buttonText: 'تأكيد',
                onTap: () {
                  if (controller.length < 4) {
                    return;
                  } else {
                    loginCubit.login(id, controller.text);
                  }
                },
              );
            }),
            const SizedBox(height: 24),
            if (1 == 1)
              const Text(
                "يمكنك إعادة إرسال الرمز بعد [30 ثانية]",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.secondaryText,
                  fontWeight: FontWeight.w400,
                ),
              )
            else
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "انتهت صلاحية الرمز",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "إعادة ارسال",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
