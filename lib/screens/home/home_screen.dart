import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydroinator/screens/home/bloc/home_bloc.dart';
import 'package:hydroinator/screens/home/view/home_loaded_view.dart';
import 'package:hydroinator/screens/home/view/home_loading_view.dart';
import 'package:hydroinator/screens/home/view/no_plants_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String route = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.state) {
          case HomeLoadingState.loading:
            return const HomeLoadingView();
          case HomeLoadingState.loaded:
            if (state.plants.isEmpty) {
              return const NoPlantsView();
            }
            return HomeLoadedView(
              plants: state.plants,
            );
        }
      },
    );
  }
}
