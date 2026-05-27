import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydroinator/screens/home/bloc/home_bloc.dart';
import 'package:hydroinator/screens/home/home_screen.dart';
import 'package:hydroinator/screens/splash/splash_screen.dart';
import 'package:hydroinator/services/locator.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        if (snapshot.hasData) {
          return BlocProvider.value(
            value: locator.get<HomeBloc>()..add(InitDataEvent()),
            child: const HomeScreen(),
          );
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
