import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_colors.dart';
import 'package:hydroinator/config/app_config.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/config/app_typography.dart';
import 'package:hydroinator/screens/add_plant/widgets/validation_field.dart';

class DatePicker extends StatefulWidget {
  final void Function(DateTime) onChanged;
  final DateTime? initialDate;
  const DatePicker({super.key, required this.onChanged, this.initialDate});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime? date = widget.initialDate;

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (value) {
        if (date == null) {
          return AppStrings.required;
        }
        return null;
      },
      builder: (field) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.plantWaterDay,
                    style: AppTypography.defaultStyle,
                  ),
                  date == null
                      ? Text(
                          AppStrings.chooseDate,
                          style: AppTypography.highlightedStyle(),
                        )
                      : Text(
                          AppConfig.defaultDateFormat.format(date!),
                          style: AppTypography.highlightedStyle(),
                        ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  var selectedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      initialDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendarOnly);
                  if (selectedDate != null) {
                    setState(() {
                      date = selectedDate;
                    });
                    widget.onChanged(selectedDate);
                    field.validate();
                  }
                },
                child: const Icon(
                  Icons.calendar_month,
                  color: AppColors.mainPurple,
                  size: 30,
                ),
              )
            ],
          ),
          ValidationField(field: field),
        ],
      ),
    );
  }
}
