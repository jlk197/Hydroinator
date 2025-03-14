import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/models/entities/image_entity.dart';
import 'package:hydroinator/models/entities/plant_entity.dart';
import 'package:hydroinator/screens/add_plant/bloc/add_plant_bloc.dart';
import 'package:hydroinator/screens/add_plant/widgets/date_picker.dart';
import 'package:hydroinator/screens/add_plant/widgets/days_widget.dart';
import 'package:hydroinator/screens/add_plant/widgets/image_picker_widget.dart';
import 'package:hydroinator/screens/add_plant/widgets/name_text_field.dart';
import 'package:hydroinator/screens/home/home_screen.dart';
import 'package:hydroinator/widgets/custom_app_bar.dart';
import 'package:hydroinator/widgets/generic_button.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});
  static const String route = "/add-plant";

  @override
  State<AddPlantScreen> createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  PlantEntity plant = PlantEntity.empty();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isEdited = false;

  @override
  void didChangeDependencies() {
    var mRoute = ModalRoute.of(context);
    if (mRoute != null) {
      var args = mRoute.settings.arguments;
      if (args != null && args is PlantEntity) {
        plant = args;
        isEdited = true;
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPlantBloc, AddPlantState>(
      listener: (context, state) {
        if (state.plantAddingState == PlantAddingState.added) {
          Navigator.pop(context);
          Navigator.popUntil(context, (route) => false);
          Navigator.pushNamed(context, HomeScreen.route);
        } else if (state.plantAddingState == PlantAddingState.adding) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: AppStrings.addPlant),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ImagePickerWidget(
                      isEnable: !isEdited,
                      images: plant.imagesFiles,
                      onChanged: (img) {
                        setState(() {
                          plant.imagesFiles = [
                            ImageEntity(image: img, dateTime: DateTime.now())
                          ];
                        });
                      },
                    ),
                    NameTextField(
                      name: plant.name,
                      onChanged: (value) {
                        setState(() {
                          plant.name = value;
                        });
                      },
                    ),
                    DaysWidget(
                      days: plant.dayInterval,
                      onChanged: (value) {
                        setState(() {
                          plant.dayInterval = value;
                        });
                      },
                    ),
                    DatePicker(
                      initialDate: plant.startDate,
                      onChanged: (value) {
                        setState(() {
                          plant.startDate = value;
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                    GenericButton(
                      title: AppStrings.save,
                      onTap: () {
                        var currentState = _formKey.currentState;
                        if (currentState?.validate() ?? false) {
                          context.read<AddPlantBloc>().add(AddPlant(plant));
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
