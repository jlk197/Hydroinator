import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:hydroinator/screens/add_plant/add_plant_screen.dart';
import 'package:hydroinator/screens/home/bloc/home_bloc.dart';
import 'package:hydroinator/screens/home/widgets/death_dialog.dart';
import 'package:hydroinator/screens/home/widgets/icon_button.dart';
import 'package:hydroinator/services/locator.dart';
import 'package:image_picker/image_picker.dart';

class ExpandedPanel extends StatelessWidget {
  final bool isExpanded;
  final Plant plant;
  const ExpandedPanel(
      {super.key, required this.isExpanded, required this.plant});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: isExpanded
          ? Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyIconButton(
                        icon: Icons.add_a_photo_outlined,
                        text: AppStrings.addPhoto,
                        onClick: () => _takePicture(context),
                      ),
                      MyIconButton(
                        icon: Icons.edit,
                        text: AppStrings.edit,
                        onClick: () {
                          Navigator.pushNamed(context, AddPlantScreen.route,
                              arguments: plant);
                        },
                      ),
                      MyIconButton(
                        icon: Icons.clear,
                        text: AppStrings.death,
                        onClick: () => _assignAsDead(context),
                      ),
                    ],
                  ),
                )
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  Future<void> _takePicture(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      context.read<HomeBloc>().add(AddPhotoEvent(file, plant.id));
    } else {
      print("BŁĄD PODCZAS WYKONYWANIA ZDJĘCIA");
    }
  }

  Future<void> _assignAsDead(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: locator.get<HomeBloc>(),
        child: DeadthDialog(
          plantId: plant.id,
        ),
      ),
    );
  }
}
