import 'package:flutter/material.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/horizontal_filter_chips.dart';

class FilterListView extends StatefulWidget {
  const FilterListView({super.key, required this.filterList});
  final List<String> filterList;
  @override
  State<FilterListView> createState() => _FilterListViewState();
}

class _FilterListViewState extends State<FilterListView> {
  int selectedIndex = 0;

  @override
  Widget build(final BuildContext context) {
    return HorizontalFilterChips(
      height: responsiveHeight(40),
      items: widget.filterList,
      selectedIndex: selectedIndex,
      onChanged: (final index) {
        setState(() => selectedIndex = index);
      },
    );
  }
}
