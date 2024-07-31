import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_typography.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onClick;
  const MyIconButton(
      {super.key,
      required this.icon,
      required this.onClick,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Icon(icon),
          Text(
            text,
            style: AppTypography.smallStyle,
          ),
        ],
      ),
    );
  }
}
