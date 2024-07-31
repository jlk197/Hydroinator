import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_typography.dart';

class ValidationField extends StatelessWidget {
  final FormFieldState field;
  const ValidationField({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return field.hasError
        ? Text(
            field.errorText ?? "",
            style: AppTypography.validationErrorStyle,
          )
        : const SizedBox();
  }
}
