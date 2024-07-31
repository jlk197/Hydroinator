import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/screens/cemetery/bloc/cemetery_bloc.dart';
import 'package:hydroinator/screens/cemetery/view/cemetery_loaded_view.dart';
import 'package:hydroinator/screens/cemetery/view/cemetery_loading_view.dart';
import 'package:hydroinator/screens/cemetery/view/empty_cemetery_view.dart';
import 'package:hydroinator/widgets/custom_app_bar.dart';

class CemeteryScreen extends StatelessWidget {
  const CemeteryScreen({super.key});
  static const String route = "/cemetery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.cemetery),
      body: BlocBuilder<CemeteryBloc, CemeteryState>(
        builder: (context, state) {
          switch (state.state) {
            case CemeteryLoadingState.loading:
              return const CemeteryLoadingView();
            case CemeteryLoadingState.loaded:
              if (state.plants.isEmpty) {
                return const EmptyCemeteryView();
              } else {
                return const CemeteryLoadedView();
              }
          }
        },
      ),
    );
  }
}
