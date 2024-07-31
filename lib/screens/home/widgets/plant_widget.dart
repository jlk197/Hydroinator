import 'package:flutter/material.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:hydroinator/screens/home/widgets/expanded_panel.dart';
import 'package:hydroinator/screens/home/widgets/image_container.dart';
import 'package:hydroinator/screens/home/widgets/plant_info.dart';

class PlantWidget extends StatefulWidget {
  final Plant plant;
  const PlantWidget({super.key, required this.plant});

  @override
  State<PlantWidget> createState() => _PlantWidgetState();
}

class _PlantWidgetState extends State<PlantWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      ImageContainer(
                        images: widget.plant.imagesFiles,
                      ),
                      PlantInfo(plant: widget.plant),
                    ],
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          _isExpanded ? Icons.expand_less : Icons.expand_more,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ExpandedPanel(
                isExpanded: _isExpanded,
                plant: widget.plant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
