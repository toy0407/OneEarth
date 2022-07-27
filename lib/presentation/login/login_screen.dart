// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/font_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';
import 'package:email_validator/email_validator.dart';

import 'auth/auth_error.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final formKey = GlobalKey<FormState>();
  bool isValid = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _emailController.addListener(
      () {
        if (EmailValidator.validate(_emailController.text)) {
          setState(() {
            isValid = true;
          });
        } else {
          setState(
            () {
              isValid = false;
            },
          );
        }
      },
    );

    var mediaQuery = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.companyLogo),
              SizedBox(height: mediaQuery.height * 0.10),
              Text('Login',
                  style: getLightStyle(
                      color: ColorManager.black, fontSize: FontSize.s40)),

              SizedBox(height: mediaQuery.height * 0.05),

              // Email text fied

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ((value) => !EmailValidator.validate(value!)
                    ? 'Enter a valid email'
                    : null),
                controller: _emailController,
                style: getRegularStyle(color: ColorManager.black),
                decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_outlined)),
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: mediaQuery.height * 0.03),

              // Password text field

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    value!.length < 8 ? 'Password must be 8 characters' : null,
                controller: _passwordController,
                style: getRegularStyle(color: ColorManager.black),
                decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password_outlined)),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              SizedBox(height: mediaQuery.height * 0.03),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    context.read<LoginBloc>().add(
                          LoginEventLogIn(
                            email: email,
                            password: password,
                          ),
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Check all the fields!!!')),
                    );
                  }
                },
                child: Text(
                  'Login',
                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: FontSize.s18),
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.12),
              const Text('Do not have an account yet?'),
              TextButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        const LoginEventGoToRegistration(),
                      );
                },
                child: const Text(
                  'Register here!',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
