import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/config/app_typography.dart';
import 'package:hydroinator/screens/add_plant/widgets/validation_field.dart';

class NameTextField extends StatefulWidget {
  final String name;
  final void Function(String) onChanged;
  const NameTextField({super.key, required this.name, required this.onChanged});

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.name);
  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (widget.name.isEmpty) {
          return AppStrings.required;
        }
        return null;
      },
      builder: (field) => Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: AppStrings.plantName,
            ),
            style: AppTypography.highlightedStyle(),
            onChanged: (value) {
              field.didChange(true);
              setState(() {
                widget.onChanged(value);
              });
            },
          ),
          ValidationField(field: field),
        ],
      ),
    );
  }
}
