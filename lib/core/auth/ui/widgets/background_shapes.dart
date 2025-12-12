import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';

class BackgroundShapes extends StatelessWidget {
  const BackgroundShapes({super.key});

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -100,
          left: -100,
          child: Container(
            width: 200.w,
            height: 200.w,
            decoration: BoxDecoration(
              color: context.customColors.containerColor.withAlpha(128),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -120,
          right: -100,
          child: Container(
            width: 200.w,
            height: 200.w,
            decoration: BoxDecoration(
              color: context.customColors.containerColor.withAlpha(128),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 150,
          right: -100,
          child: Container(
            width: 150.w,
            height: 150.w,
            decoration: BoxDecoration(
              color: context.customColors.containerColor.withAlpha(128),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
