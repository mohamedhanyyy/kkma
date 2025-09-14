import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kkma/core/cubit/base_cubit_state.dart';
import 'package:kkma/core/resources/colors.dart';
import 'package:kkma/shared/widgets/bubble_widget.dart';
import 'package:kkma/shared/widgets/custom_button.dart';
import 'package:kkma/shared/widgets/custom_loading_widget.dart';
import 'package:kkma/shared/widgets/custom_text_field.dart';

import '../cubit/send_otp_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final idController =
      TextEditingController(text: kDebugMode ? "1017206242" : null);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const BubbleWidget(),
              Image.asset('assets/images/logo.png',
                  color: AppColors.primaryColor),
              const SizedBox(height: 40),
              const Text(
                "تسجيل الدخول",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "فضلاً أدخل رقم الهوية الوطنية للمتابعة",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.secondaryText,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomTextField(
                    hintText: 'رقم الهوية الوطنية',
                    controller: idController,
                    prefixIcon: SvgPicture.asset('assets/icons/card.svg'),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 10) {
                        return "الرجاء إدخال رقم هوية صحيح";
                      }
                      return null;
                    },
                  )),
              const SizedBox(height: 24),
              BlocBuilder<SendOtpCubit, CubitState>(builder: (context, state) {
                if (state == CubitState.loading) {
                  return const CustomLoadingButtonWidget();
                }
                return CustomElevatedButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<SendOtpCubit>().sendOtp(idController.text);
                      }
                    },
                    buttonText: 'تسجيل الدخول');
              }),
            ],
          ),
        ),
      ),
    );
  }
}
