import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:kkma/modules/home/presentation/screens/home_screen.dart';
import 'package:kkma/services/navigation/navigation.dart';

import '../../../core/resources/colors.dart';
import '../../../shared/widgets/custom_button.dart';

class VerificationDoneScreen extends StatelessWidget {
  const VerificationDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.asset(
                'assets/images/gradient.png',
                width: double.infinity,
              ),
              SvgPicture.asset('assets/icons/done.svg'),
            ],
          ),
          const SizedBox(height: 48),
          const Text(
            "حيّاك الله",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),

          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "سعيدين بانضمامك معنا. تقدر تبدأ استخدام خدماتنا مباشرة.",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(

        padding:  const EdgeInsets.only(
          bottom: 66,
          right: 24,
          left: 24
        ),
        child: CustomElevatedButton(

            widget: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back,color: Colors.white,),
                SizedBox(width: 10),
                Text(
                  "ابدأ الآن",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ],
            ),
            onTap: () {
              AppNavigation.navigateOffAll(const HomeScreen());
            }),
      ),
    );
  }
}
