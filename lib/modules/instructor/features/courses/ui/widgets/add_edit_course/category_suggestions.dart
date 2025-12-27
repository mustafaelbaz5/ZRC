import 'package:flutter/material.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/models/category_model.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class CategorySuggestions extends StatelessWidget {
  const CategorySuggestions({super.key, required this.onCategorySelected});

  final ValueChanged<String> onCategorySelected;

  static List<String> suggestions = CategoryModel.categories
      .map((final e) => e.title)
      .toList();

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;
    return Wrap(
      spacing: responsiveWidth(10),
      runSpacing: responsiveHeight(10),
      children: suggestions.map((final category) {
        return Material(
          color: colors.divider.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(responsiveRadius(24)),
          child: InkWell(
            borderRadius: BorderRadius.circular(responsiveRadius(24)),
            onTap: () => onCategorySelected(category),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(16),
                vertical: responsiveHeight(10),
              ),
              child: Text(
                category,
                style: AppTextStyles.font13Regular.copyWith(
                  color: colors.textPrimary,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
