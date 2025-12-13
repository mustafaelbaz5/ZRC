import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/spacing.dart';

class HeroVideoSection extends StatelessWidget {
  final VoidCallback onTap;
  const HeroVideoSection({super.key, required this.onTap});

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: responsiveHeight(200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=800&h=400&fit=crop',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.customColors.containerColor.withAlpha(200),
                context.customColors.containerColor.withAlpha(100),
              ],
            ),
          ),
          child: Center(
            child: Container(
              width: responsiveWidth(64),
              height: responsiveHeight(64),
              decoration: BoxDecoration(
                color: context.customColors.secondaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: context.customColors.onContainerPrimary.withAlpha(
                      100,
                    ),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                size: 36,
                color: context.customColors.onContainerPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
