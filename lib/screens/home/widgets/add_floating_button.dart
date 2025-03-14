import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydroinator/screens/add_plant/add_plant_screen.dart';
import 'package:hydroinator/screens/home/bloc/home_bloc.dart';

class AddFloatingButton extends StatelessWidget {
  final TimeOfDay timeOfDay;
  const AddFloatingButton({super.key, required this.timeOfDay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: "time",
            onPressed: () =>
                showTimePicker(context: context, initialTime: timeOfDay).then(
              (value) {
                if (value != null) {
                  context
                      .read<HomeBloc>()
                      .add(ChangeNotificationsTimeEvent(value));
                }
              },
            ),
            child: const Icon(Icons.access_time),
          ),
          FloatingActionButton(
            heroTag: "add",
            onPressed: () => Navigator.pushNamed(context, AddPlantScreen.route),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
