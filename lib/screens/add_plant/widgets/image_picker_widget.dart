import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_colors.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/models/entities/image_entity.dart';
import 'package:hydroinator/screens/add_plant/widgets/validation_field.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final bool isEnable;
  final List<ImageEntity> images;
  final void Function(String) onChanged;
  const ImagePickerWidget(
      {super.key,
      required this.onChanged,
      required this.images,
      required this.isEnable});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (value) {
        if (widget.images.isEmpty) {
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
              child: widget.images.isEmpty
                  ? const Icon(
                      Icons.photo_camera,
                      size: 50,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.file(
                        File(widget.images.last.image),
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
      File file = File(pickedFile.path);
      widget.onChanged(file.path);
    } else {
      print("BŁĄD PODCZAS WYKONYWANIA ZDJĘCIA");
    }
  }
}
