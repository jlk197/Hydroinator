import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_colors.dart';

class DaysButton extends StatelessWidget {
  final IconData icon;
  final void Function() onChange;
  const DaysButton({super.key, required this.icon, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChange(),
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.mainPurple,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
