import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_config.dart';
import 'package:hydroinator/config/app_typography.dart';
import 'package:hydroinator/models/image.dart';

class CarouselItem extends StatelessWidget {
  final ImageData image;
  const CarouselItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppConfig.defaultDateFormat.format(image.dateTime ?? DateTime.now()),
          style: AppTypography.highlightedStyle(color: Colors.white),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: CachedNetworkImageProvider(image.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
