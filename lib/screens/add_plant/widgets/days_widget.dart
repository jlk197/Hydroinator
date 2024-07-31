import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_colors.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/config/app_typography.dart';
import 'package:hydroinator/screens/add_plant/widgets/days_button.dart';

class DaysWidget extends StatefulWidget {
  final int days;
  final void Function(int) onChanged;
  const DaysWidget({super.key, required this.days, required this.onChanged});

  @override
  State<DaysWidget> createState() => _DaysWidgetState();
}

class _DaysWidgetState extends State<DaysWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.plantDayInterval,
            style: AppTypography.defaultStyle,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.mainPurple),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                DaysButton(
                  onChange: () {
                    if (widget.days > 1) {
                      widget.onChanged(widget.days - 1);
                    }
                  },
                  icon: Icons.remove,
                ),
                Expanded(
                  child: Text(
                    widget.days.toString(),
                    style: AppTypography.highlightedStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
                DaysButton(
                  onChange: () {
                    widget.onChanged(widget.days + 1);
                  },
                  icon: Icons.add,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
