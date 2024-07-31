import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_colors.dart';
import 'package:hydroinator/config/app_typography.dart';

class CustomAppBar extends AppBar {
  final bool showBackButton;
  final bool showActions;
  final void Function()? onAction;
  CustomAppBar(
      {super.key,
      required String title,
      this.showBackButton = true,
      this.showActions = false,
      this.onAction})
      : super(
            centerTitle: true,
            automaticallyImplyLeading: showBackButton,
            foregroundColor: Colors.white,
            backgroundColor: AppColors.mainPurple,
            title: Text(
              title,
              style: AppTypography.appBarStyle,
            ),
            actions: showActions
                ? [
                    GestureDetector(
                        onTap: onAction,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.local_hospital_outlined,
                            size: 30,
                          ),
                        ))
                  ]
                : []);
}
