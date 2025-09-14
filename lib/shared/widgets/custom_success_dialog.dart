import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kkma/services/navigation/navigation.dart';

class AppDialog {
  static void showSuccessPopup() {
    showDialog(
      context: AppNavigation.context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: const EdgeInsets.only(bottom: 100),
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          child: Container(
            height: 240,
            width: 200,
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "أبشر",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "تم حفظ بياناتك بنجاح",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 90,
                    child: SvgPicture.asset("assets/icons/check.svg")),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showErrorPopup(title, desc) {
    showDialog(
      context: AppNavigation.context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: const EdgeInsets.only(bottom: 100),
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          child: Container(
            height: 240,
            width: 200,
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 90,
                    child: SvgPicture.asset("assets/icons/check.svg")),
              ],
            ),
          ),
        );
      },
    );
  }
}
