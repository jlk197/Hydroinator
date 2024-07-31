import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydroinator/screens/cemetery/bloc/cemetery_bloc.dart';
import 'package:hydroinator/screens/cemetery/widgets/dead_plant_card.dart';

class CemeteryLoadedView extends StatelessWidget {
  const CemeteryLoadedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CemeteryBloc, CemeteryState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [...state.plants.map((e) => DeadPlantCard(plant: e))],
            ),
          ),
        );
      },
    );
  }
}
