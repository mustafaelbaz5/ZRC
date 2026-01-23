import 'dart:io';

import 'package:flutter/material.dart';
import '../utils/app_image_picker.dart';

import '../../../../core/utils/spacing.dart';

class UploadImageField extends StatelessWidget {
  final File? initialImage;
  final Function(File? image)? onImageSelected;

  const UploadImageField({super.key, this.initialImage, this.onImageSelected});

  Future<void> _pickImage(final BuildContext context) async {
    try {
      final pickedImage = await AppImagePicker.showImageSourceActionSheet(
        context,
      );

      if (pickedImage != null) {
        onImageSelected?.call(pickedImage);
      }
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to pick image. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _pickImage(context),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: responsiveWidth(48),
                backgroundColor: Theme.of(context).colorScheme.surface,
                backgroundImage: initialImage != null
                    ? FileImage(initialImage!)
                    : null,
                child: initialImage == null
                    ? Icon(
                        Icons.person,
                        size: responsiveWidth(48),
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withAlpha(100),
                      )
                    : null,
              ),
              Container(
                padding: EdgeInsets.all(responsiveWidth(6)),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surface,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.edit,
                  size: responsiveWidth(16),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
