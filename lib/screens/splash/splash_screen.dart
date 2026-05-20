import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/screens/login/login_screen.dart';
import 'package:hydroinator/widgets/generic_button.dart';

class SplashScreen extends StatelessWidget {
  static const route = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon.png',
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            GenericButton(
              title: AppStrings.logIn,
              onTap: () => Navigator.pushNamed(
                context,
                LoginScreen.route,
                arguments: true,
              ),
            ),
            const SizedBox(height: 16),
            GenericButton(
              title: AppStrings.signIn,
              onTap: () => Navigator.pushNamed(
                context,
                LoginScreen.route,
                arguments: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
