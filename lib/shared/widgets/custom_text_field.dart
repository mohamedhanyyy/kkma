import 'package:flutter/material.dart';

import '../../core/resources/colors.dart';
import '../../services/navigation/navigation.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Color? hintColor;
  final int? maxLength;
  final int? maxLines;
  final Color? fillColor;
  final Color borderColor;
  final Widget? prefixIcon;
  final double borderRadius;
  final double? hintFontSize;
  final String? suffixIcon;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputAction textInputAction;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.maxLines,
    this.maxLength,
    this.focusNode,
    this.onSubmitted,
    this.borderRadius = 8,
    this.hintColor,
    this.hintFontSize,
    this.fillColor,
    this.borderColor = AppColors.formField,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      focusNode: focusNode,
      maxLength: maxLength,
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        contentPadding: EdgeInsets.zero,
        hintStyle: TextStyle(
            color: hintColor ?? AppColors.formField, fontSize: hintFontSize??12),
        fillColor:
            fillColor ?? Theme.of(AppNavigation.context).secondaryHeaderColor,
        prefixIconConstraints: const BoxConstraints(),
        filled: true,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: prefixIcon)
            : const SizedBox(width: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor.withValues(alpha: 0.7)),
            borderRadius: BorderRadius.circular(borderRadius)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(borderRadius)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}
