import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/config/app_typography.dart';
import 'package:hydroinator/models/plant.dart';

class PlantInfo extends StatelessWidget {
  final Plant plant;
  const PlantInfo({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plant.name.toUpperCase(),
              style: AppTypography.titleStyle,
            ),
            Text.rich(
              TextSpan(text: "${AppStrings.watering} ", children: [
                TextSpan(
                  text: plant.wateringIntervalString,
                  style: AppTypography.defaultBoldStyle,
                )
              ]),
              style: AppTypography.defaultStyle,
            ),
            const Divider(
              height: 6,
              thickness: 0.5,
            ),
            Text.rich(
              overflow: TextOverflow.clip,
              TextSpan(text: AppStrings.nextWatering, children: [
                TextSpan(
                  text: plant.nextWateringString,
                  style: AppTypography.defaultBoldStyle,
                )
              ]),
              style: AppTypography.defaultStyle,
            ),
          ],
        ),
      ),
    );
  }
}
