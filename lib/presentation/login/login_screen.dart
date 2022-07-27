import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/font_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';
import 'package:one_earth/temp/if_debugging.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

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
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
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
            TextFormField(
              controller: _emailController,
              style: getRegularStyle(color: ColorManager.black),
              decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined)),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: mediaQuery.height * 0.03),
            TextFormField(
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
                final email = _emailController.text;
                final password = _passwordController.text;
                context.read<LoginBloc>().add(
                      LoginEventLogIn(
                        email: email,
                        password: password,
                      ),
                    );
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
    );
  }
}
