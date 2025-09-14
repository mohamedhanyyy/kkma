import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/resources/colors.dart';

const customButtonTextStyle = TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w400);

class CustomElevatedButton extends StatelessWidget {
  final String? buttonText;
  final FontWeight? fontWeight;
  final Function onTap;
  final double? borderRadius;
  final Color? fontColor;
  final double? fontSize;
  final double? height;
  final Widget? widget;
  final double? padding;
  final Color? color;
  final Color? borderColor;

  const CustomElevatedButton({
    super.key,
    required this.onTap,
    this.buttonText,
    this.fontWeight,
    this.borderRadius,
    this.fontColor,
    this.widget,
    this.height,
    this.borderColor,
    this.padding,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 20),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 48.h),
          elevation: 0,
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? AppColors.primaryColor),
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
          ),
        ),
        child: widget ??
            Text(buttonText??"",
                textAlign: TextAlign.center,
                style: customButtonTextStyle.copyWith(
                  fontWeight: fontWeight,
                    color: fontColor??Colors.white, fontSize: fontSize)),
      ),
    );
  }
}
