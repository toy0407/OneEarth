import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

String patttern = r'^[a-z A-Z,.\-]+$';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  RegExp regExp = RegExp(patttern);

  final formKey = GlobalKey<FormState>();
  bool isValid = false;

  @override
  void initState() {
    super.initState();
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
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            key: const ValueKey(1),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.companyLogo),
              SizedBox(height: mediaQuery.height * 0.06),
              Text('Register',
                  style: getLightStyle(
                      color: ColorManager.black, fontSize: FontSize.s40)),
              SizedBox(height: mediaQuery.height * 0.04),

              // Name text field

              TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _nameController,
                  style: getRegularStyle(color: ColorManager.black),
                  validator: (value) =>
                      value!.isEmpty || !regExp.hasMatch(value)
                          ? 'Enter valid name'
                          : null,
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_outlined)),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next),

              SizedBox(height: mediaQuery.height * 0.02),

              // Email text field

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
                  textInputAction: TextInputAction.next),

              SizedBox(height: mediaQuery.height * 0.02),

              // Password text field

              TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordController,
                  style: getRegularStyle(color: ColorManager.black),
                  validator: (value) => value!.length < 8
                      ? 'Password must be 8 characters'
                      : null,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password_outlined)),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.next),

              SizedBox(height: mediaQuery.height * 0.02),

              // Confirm password field

              TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _confirmPasswordController,
                  style: getRegularStyle(color: ColorManager.black),
                  validator: (value) => value! != _passwordController.text
                      ? 'Your password does not match'
                      : null,
                  decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password_outlined)),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.done),

              SizedBox(height: mediaQuery.height * 0.02),

              // Register Button

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final name = _nameController.text;
                    context.read<LoginBloc>().add(
                          LoginEventRegister(
                              email: email, password: password, name: name),
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Check all the fields!!!')),
                    );
                  }
                },
                child: Text(
                  'Register',
                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: FontSize.s18),
                ),
              ),

              SizedBox(height: mediaQuery.height * 0.04),

              // Go to Login button

              const Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<LoginBloc>().add(
                        const LoginEventGoToLogin(),
                      );
                },
                child: const Text(
                  'Login here!',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
