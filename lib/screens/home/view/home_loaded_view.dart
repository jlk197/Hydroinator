import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:hydroinator/screens/cemetery/cemetery_screen.dart';
import 'package:hydroinator/screens/home/widgets/add_floating_button.dart';
import 'package:hydroinator/screens/home/widgets/plant_widget.dart';
import 'package:hydroinator/widgets/custom_app_bar.dart';

class HomeLoadedView extends StatelessWidget {
  final List<Plant> plants;
  const HomeLoadedView({super.key, required this.plants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: false,
        title: AppStrings.collection,
        showActions: true,
        onAction: () => Navigator.pushNamed(context, CemeteryScreen.route),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(children: [...plants.map((e) => PlantWidget(plant: e))]),
        ),
      ),
      floatingActionButton: const AddFloatingButton(),
    );
  }
}
