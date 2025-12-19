import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/modules/student/core/widgets/filter_chip_item.dart';

class HorizontalFilterChips extends StatelessWidget {
  const HorizontalFilterChips({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
    this.height,
  });

  final List<String> items;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final double? height;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: height ?? 60.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: items.length,
        itemBuilder: (final context, final index) {
          return FilterChipItem(
            label: items[index],
            isSelected: selectedIndex == index,
            onTap: () => onChanged(index),
          );
        },
      ),
    );
  }
}
