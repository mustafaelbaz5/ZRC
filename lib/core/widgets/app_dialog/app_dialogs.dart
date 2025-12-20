import 'package:flutter/material.dart';

import 'app_dialog_widget.dart';
import 'dialog_config.dart';

class AppDialogs {
  AppDialogs._();

  static Future<bool?> show({
    required final BuildContext context,
    required final String title,
    required final String message,
    final DialogType type = DialogType.info,
    final String? primaryButtonText,
    final String? secondaryButtonText,
    final VoidCallback? onPrimaryPressed,
    final VoidCallback? onSecondaryPressed,
    final bool barrierDismissible = true,
    final Widget? customContent,
    final DialogConfig? customConfig,
  }) {
    final config = customConfig ?? DialogConfig.fromType(type);
    final hasSecondaryButton = secondaryButtonText != null;

    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black.withValues(alpha: .5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (final ctx, final anim, final secondaryAnim) =>
          AppDialogWidget(
            title: title,
            message: message,
            config: config,
            primaryButtonText: primaryButtonText ?? _getDefaultButtonText(type),
            secondaryButtonText: secondaryButtonText,
            onPrimaryPressed: () {
              onPrimaryPressed?.call();
              Navigator.of(ctx).pop(true);
            },
            onSecondaryPressed: hasSecondaryButton
                ? () {
                    onSecondaryPressed?.call();
                    Navigator.of(ctx).pop(false);
                  }
                : null,
            customContent: customContent,
          ),
      transitionBuilder:
          (final ctx, final anim, final secondaryAnim, final child) {
            return Transform.scale(
              scale: CurvedAnimation(
                parent: anim,
                curve: const Interval(0.0, 1.0, curve: Curves.easeOutBack),
              ).value,
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: anim,
                  curve: const Interval(0.0, 0.65, curve: Curves.easeOut),
                ),
                child: child,
              ),
            );
          },
    );
  }

  /// Show error dialog
  static Future<bool?> showError({
    required final BuildContext context,
    required final String title,
    required final String message,
    final String buttonText = 'OK',
    final VoidCallback? onPressed,
  }) {
    return show(
      context: context,
      title: title,
      message: message,
      type: DialogType.error,
      primaryButtonText: buttonText,
      onPrimaryPressed: onPressed,
    );
  }

  /// Show success dialog
  static Future<bool?> showSuccess({
    required final BuildContext context,
    required final String title,
    required final String message,
    final String buttonText = 'OK',
    final VoidCallback? onPressed,
  }) {
    return show(
      context: context,
      title: title,
      message: message,
      type: DialogType.success,
      primaryButtonText: buttonText,
      onPrimaryPressed: onPressed,
    );
  }

  /// Show confirmation dialog
  static Future<bool?> showConfirmation({
    required final BuildContext context,
    required final String title,
    required final String message,
    final String confirmText = 'Confirm',
    final String cancelText = 'Cancel',
    final VoidCallback? onConfirm,
    final VoidCallback? onCancel,
  }) {
    return show(
      context: context,
      title: title,
      message: message,
      type: DialogType.confirmation,
      primaryButtonText: confirmText,
      secondaryButtonText: cancelText,
      onPrimaryPressed: onConfirm,
      onSecondaryPressed: onCancel,
    );
  }

  /// Show warning dialog
  static Future<bool?> showWarning({
    required final BuildContext context,
    required final String title,
    required final String message,
    final String buttonText = 'OK',
    final VoidCallback? onPressed,
  }) {
    return show(
      context: context,
      title: title,
      message: message,
      type: DialogType.warning,
      primaryButtonText: buttonText,
      onPrimaryPressed: onPressed,
    );
  }

  static String _getDefaultButtonText(final DialogType type) {
    switch (type) {
      case DialogType.confirmation:
        return 'Confirm';
      default:
        return 'OK';
    }
  }
}
