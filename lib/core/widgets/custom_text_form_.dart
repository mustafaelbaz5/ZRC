import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zrc/core/utils/regex.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';
import '../utils/functions/app_language.dart';
import 'dart:ui' as ui; // Add this import

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.prefixIcon,
    this.isObscureText = false,
    this.maxLines = 1,
    this.innerBackgroundColor,
    this.inputTextStyle,
    this.hintStyle,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.borderRadius,
    this.autofocus = false,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final bool isObscureText;
  final int maxLines;
  final Color? innerBackgroundColor;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final double? borderRadius;
  final bool autofocus;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;
  ui.TextDirection? _direction = ui.TextDirection.ltr;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText;

    // Initialize direction based on initial text
    if (widget.controller != null && widget.controller!.text.isNotEmpty) {
      _direction = AppRegex().isArabic(widget.controller!.text)
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr;
    }
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _updateDirection(String value) {
    setState(() {
      _direction = AppRegex().isArabic(value)
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr;
    });
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(widget.borderRadius ?? 16.0);

    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      maxLines: widget.maxLines,
      autofocus: widget.autofocus,
      style: widget.inputTextStyle ?? AppTextStyles.font16BlackRegular(),
      validator: widget.validator,
      textDirection: _direction,
      onChanged: (value) {
        // Update text direction
        _updateDirection(value);

        // Automatically romanize if locale is English
        if (context.locale.languageCode == 'en' && AppRegex().isArabic(value)) {
          final converted = changeNameToEn(context, value);
          widget.controller?.value = TextEditingValue(
            text: converted,
            selection: TextSelection.collapsed(offset: converted.length),
          );
        }

        if (widget.onChanged != null) widget.onChanged!(value);
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        filled: true,
        fillColor: widget.innerBackgroundColor ?? Colors.transparent,
        hintText: widget.hintText,
        hintStyle:
            widget.hintStyle ??
            AppTextStyles.font16BlackRegular().copyWith(
              color: const Color(0xFFC1C1C1),
            ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isObscureText
            ? GestureDetector(
                onTap: _toggleObscure,
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                  size: 22.sp,
                ),
              )
            : null,
        focusedBorder:
            widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.lightBlue,
                width: 1.3,
              ),
              borderRadius: radius,
            ),
        enabledBorder:
            widget.enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFAFAFAF), width: .7),
              borderRadius: radius,
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.4),
          borderRadius: radius,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.4),
          borderRadius: radius,
        ),
      ),
    );
  }
}
