import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/functions/string_fun.dart';

import '../utils/regex.dart';

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
  ui.TextDirection _direction = ui.TextDirection.ltr;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText;

    final text = widget.controller?.text;
    if (text != null && text.isNotEmpty) {
      _direction = AppRegex().isArabic(text)
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr;
    }
  }

  void _toggleObscure() => setState(() => _obscureText = !_obscureText);

  void _updateDirection(final String value) {
    setState(() {
      _direction = AppRegex().isArabic(value)
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr;
    });
  }

  OutlineInputBorder _buildBorder(final Color color, {final double width = 1}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: width),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      maxLines: widget.maxLines,
      autofocus: widget.autofocus,
      textDirection: _direction,
      validator: widget.validator,
      style:
          widget.inputTextStyle ??
          AppTextStyles.font16Regular.copyWith(
            color: context.customColors.textPrimary,
          ),
      onChanged: (final value) {
        _updateDirection(value);

        if (context.isArabic && AppRegex().isArabic(value)) {
          final converted = convertNamesToEn(context, value);
          widget.controller?.value = TextEditingValue(
            text: converted,
            selection: TextSelection.collapsed(offset: converted.length),
          );
        }

        widget.onChanged?.call(value);
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),

        filled: true,
        fillColor:
            widget.innerBackgroundColor ??
            context.customColors.surfaceVariant.withAlpha(88),

        hintText: widget.hintText,
        hintStyle:
            widget.hintStyle ??
            AppTextStyles.font16Regular.copyWith(
              color: context.customColors.textSecondary.withAlpha(128),
            ),

        prefixIcon: widget.prefixIcon,

        suffixIcon: widget.isObscureText
            ? GestureDetector(
                onTap: _toggleObscure,
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: _obscureText
                      ? context.customColors.textSecondary
                      : context.customColors.textPrimary,
                  size: 22.sp,
                ),
              )
            : null,

        focusedBorder:
            widget.focusedBorder ??
            _buildBorder(context.customColors.textPrimary, width: 1.3),

        enabledBorder:
            widget.enabledBorder ??
            _buildBorder(context.customColors.border, width: 0.8),

        errorBorder: _buildBorder(AppColors.error100, width: 1.4),

        focusedErrorBorder: _buildBorder(AppColors.error100, width: 1.4),
      ),
    );
  }
}
