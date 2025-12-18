import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zrc/core/utils/spacing.dart';

class AppImagePicker {
  static Future<File?> showImageSourceActionSheet(
    final BuildContext context,
  ) async {
    return showModalBottomSheet<File?>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(responsiveHeight(20)),
        ),
      ),
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: responsiveHeight(16),
              horizontal: responsiveWidth(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from Gallery'),
                  onTap: () async {
                    Navigator.pop(
                      context,
                      await _pickImage(ImageSource.gallery),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Take a Photo'),
                  onTap: () async {
                    Navigator.pop(
                      context,
                      await _pickImage(ImageSource.camera),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<File?> _pickImage(final ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 75);
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}
