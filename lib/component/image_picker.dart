import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatelessWidget {
  final picker = ImagePicker();
  final Function(FormData) onImageSelected;

  ImagePickerDialog({super.key, required this.onImageSelected});

  Future<void> _getImageFromCamera(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 60);
    if (pickedFile != null) {
      FormData file = FormData.fromMap({
        "file": MultipartFile.fromFileSync(
          pickedFile.path,
          filename: pickedFile.name,
        )
      });
      onImageSelected(file);
    } else {}
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  Future<void> _getImageFromGallery(BuildContext context) async {
    final XFile? pickedFiles = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800, // Set the maximum width of the selected images
      imageQuality: 60, // Set the image quality
    );

    if (pickedFiles != null) {
      FormData file = FormData.fromMap({
        "file": MultipartFile.fromFileSync(
          pickedFiles.path,
          filename: pickedFiles.name,
        )
      });
      onImageSelected(file);
    } else {}

    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('Take a photo'),
          onTap: () {
            _getImageFromCamera(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo_library),
          title: const Text('Choose from gallery'),
          onTap: () {
            _getImageFromGallery(context);
          },
        ),
      ],
    );
  }
}
