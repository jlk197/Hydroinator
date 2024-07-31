import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/widgets/custom_app_bar.dart';

class CemeteryLoadingView extends StatelessWidget {
  const CemeteryLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: false,
        title: AppStrings.collection,
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
