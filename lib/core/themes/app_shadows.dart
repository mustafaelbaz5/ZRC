import 'package:flutter/rendering.dart';

import 'app_colors.dart';

class AppShadows {
  const AppShadows._();

  static const BoxShadow shadow1 = BoxShadow(
    color: AppColors.grey200,
    blurRadius: 10,
    offset: Offset(0, 10),
  );
}
