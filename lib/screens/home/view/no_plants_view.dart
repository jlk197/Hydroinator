import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/config/app_typography.dart';
import 'package:hydroinator/screens/cemetery/cemetery_screen.dart';
import 'package:hydroinator/screens/home/widgets/add_floating_button.dart';
import 'package:hydroinator/widgets/custom_app_bar.dart';

class NoPlantsView extends StatelessWidget {
  final TimeOfDay timeOfDay;
  const NoPlantsView({super.key, required this.timeOfDay});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: false,
        title: AppStrings.collection,
        showActions: true,
        onAction: () => Navigator.pushNamed(context, CemeteryScreen.route),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.noPlants,
                style: AppTypography.highlightedStyle(),
              ),
              const Icon(
                Icons.south_east_outlined,
                size: 50,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: AddFloatingButton(timeOfDay: timeOfDay),
    );
  }
}
