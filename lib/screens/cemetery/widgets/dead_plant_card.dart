import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hydroinator/config/app_config.dart';
import 'package:hydroinator/config/app_typography.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:hydroinator/screens/home/widgets/image_container.dart';

class DeadPlantCard extends StatelessWidget {
  final Plant plant;
  const DeadPlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          ImageContainer(
            images: plant.imagesFiles,
            showGrey: true,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    plant.name.toUpperCase(),
                    style: AppTypography.highlightedStyle(),
                  ),
                  Text(
                    "ur. ${AppConfig.defaultDateFormat.format(plant.addDate)}",
                    style: AppTypography.defaultStyle,
                  ),
                  Text(
                    "zm. ${AppConfig.defaultDateFormat.format(plant.addDate)}",
                    style: AppTypography.defaultStyle,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
