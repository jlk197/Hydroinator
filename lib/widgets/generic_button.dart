import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_typography.dart';

class GenericButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final bool enabled;
  const GenericButton({super.key, required this.title, required this.onTap, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 6,
          minimumSize: const Size.fromHeight(50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onPressed: enabled ? onTap : null,
        child: Text(
          title,
          style: AppTypography.defaultStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
