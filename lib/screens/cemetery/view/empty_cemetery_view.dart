import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/config/app_typography.dart';

class EmptyCemeteryView extends StatelessWidget {
  const EmptyCemeteryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.congratulations,
              style: AppTypography.highlightedStyle(),
            ),
            Text(
              AppStrings.cemeteryEmpty,
              style: AppTypography.highlightedStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
