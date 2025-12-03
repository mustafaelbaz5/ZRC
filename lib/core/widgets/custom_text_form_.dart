import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

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

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText;
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(widget.borderRadius ?? 16.0);

    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      maxLines: widget.maxLines,
      autofocus: widget.autofocus,
      style: widget.inputTextStyle ?? AppTextStyles.font16BlackRegular(),
      validator: widget.validator,
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
