import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/config/app_typography.dart';
import 'package:hydroinator/screens/home/bloc/home_bloc.dart';
import 'package:hydroinator/widgets/generic_button.dart';

class DeadthDialog extends StatelessWidget {
  final int plantId;
  const DeadthDialog({super.key, required this.plantId});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.asset("assets/grave.png")),
            const Text(
              AppStrings.deathAssurance,
              style: AppTypography.titleStyle,
            ),
            const Text(
              AppStrings.buyNew,
              style: AppTypography.defaultStyle,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GenericButton(
                      title: AppStrings.falseAlarm,
                      onTap: () => Navigator.pop(context)),
                ),
                Expanded(
                  child: GenericButton(
                    title: AppStrings.funeral,
                    onTap: () {
                      Navigator.pop(context);
                      context.read<HomeBloc>().add(AssignAsDeadEvent(plantId));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
