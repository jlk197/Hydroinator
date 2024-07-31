import 'package:flutter/material.dart';
import 'package:hydroinator/screens/add_plant/add_plant_screen.dart';

class AddFloatingButton extends StatelessWidget {
  const AddFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, AddPlantScreen.route),
      child: const Icon(Icons.add),
    );
  }
}
