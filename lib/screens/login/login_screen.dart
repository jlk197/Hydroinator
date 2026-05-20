import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydroinator/config/app_strings.dart';
import 'package:hydroinator/config/app_typography.dart';
import 'package:hydroinator/screens/login/bloc/login_bloc.dart';
import 'package:hydroinator/widgets/generic_button.dart';
import 'package:hydroinator/widgets/custom_app_bar.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool isLogin;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    isLogin = ModalRoute.of(context)!.settings.arguments as bool;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state.status) {
          case LoginStatus.loading:
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;
          case LoginStatus.failure:
            Navigator.of(context).pop();
            break;
          case LoginStatus.success:
            Navigator.of(context).popUntil((route) => route.isFirst);
            break;
          case LoginStatus.initial:
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: isLogin ? AppStrings.logIn : AppStrings.signIn,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: AppStrings.email,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.validationEmailEmpty;
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return AppStrings.validationEmailInvalid;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordController,
                    obscureText: true,
                     decoration: const InputDecoration(
                      hintText: AppStrings.password,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.validationPasswordEmpty;
                      }
                      if (value.length < 6) {
                        return AppStrings.validationPasswordLength;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  LayoutBuilder(builder: (context, constraints) {
                    if (state.status == LoginStatus.failure) {
                      return Text(state.errorMessage ?? "",
                          style: AppTypography.validationErrorStyle);
                    }
                    return const SizedBox.shrink();
                  }),
                  const SizedBox(height: 32),
                  GenericButton(
                    enabled: _controller.text.isNotEmpty && _passwordController.text.isNotEmpty,
                    title: isLogin ? AppStrings.logIn : AppStrings.signIn,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(LoginSubmittedEvent(
                            username: _controller.text,
                            password: _passwordController.text,
                            isLogin: isLogin));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
