import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_colors.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/screens/add_plant/widgets/validation_field.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final bool isEnable;
  final File? image;
  final String? imageUrl;
  final void Function(File) onChanged;
  const ImagePickerWidget(
      {super.key,
      required this.onChanged,
      required this.image,
      required this.imageUrl,
      required this.isEnable});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (value) {
        if (widget.image == null && widget.imageUrl == null) {
          return AppStrings.required;
        }
        return null;
      },
      builder: (field) => Column(
        children: [
          GestureDetector(
            onTap: () => _takePicture(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      color: field.hasError ? Colors.red : Colors.black)),
              child: widget.image == null && widget.imageUrl == null
                  ? const Icon(
                      Icons.photo_camera,
                      size: 50,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: widget.imageUrl != null
                          ? Image.network(
                              widget.imageUrl!,
                              fit: BoxFit.fitHeight,
                            )
                          : Image.file(
                              widget.image!,
                              fit: BoxFit.fitHeight,
                            ),
                    ),
            ),
          ),
          ValidationField(field: field),
        ],
      ),
    );
  }

  Future<void> _takePicture() async {
    if (!widget.isEnable) return;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      widget.onChanged(File(pickedFile.path));
    } else {
      print("BŁĄD PODCZAS WYKONYWANIA ZDJĘCIA");
    }
  }
}
