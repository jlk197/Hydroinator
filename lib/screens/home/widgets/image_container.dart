import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hydroinator/models/entities/image_entity.dart';
import 'package:hydroinator/screens/home/widgets/carousel_item.dart';

class ImageContainer extends StatelessWidget {
  final List<ImageEntity> images;
  final bool showGrey;
  const ImageContainer(
      {super.key, required this.images, this.showGrey = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: CarouselSlider(
                  items: [
                    ...images.map(
                      (e) => CarouselItem(
                        image: e,
                      ),
                    )
                  ],
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.6,
                      enableInfiniteScroll: false),
                ),
              ),
            ],
          );
        },
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: showGrey
              ? ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.grey,
                    BlendMode.saturation,
                  ),
                  child: Image.file(
                    File(
                      images.last.image,
                    ),
                  ),
                )
              : Image.file(
                  File(
                    images.last.image,
                  ),
                ),
        ),
      ),
    );
  }
}
