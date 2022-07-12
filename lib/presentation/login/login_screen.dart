import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_repository.dart';
import 'login_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider(
            create: (context) => LoginBloc(
              authRepo: context.read<AuthRepository>(),
            ),
            child: _loginForm(),
          ),
        ],
      ),
    );
  }
}

Widget _loginForm() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Column(
      children: [_emailField(), _passwordField(), _loginButton()],
    ),
  );
}

Widget _emailField() {
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Email Id',
      ),
      validator: (value) => null,
      onChanged: (value) =>
          context.read<LoginBloc>().add(LoginEmailChanged(email: value)),
    );
  });
}

Widget _passwordField() {
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Password',
      ),
      validator: (value) => null,
      onChanged: (value) =>
          context.read<LoginBloc>().add(LoginPasswordChanged(password: value)),
    );
  });
}

Widget _loginButton() {
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return ElevatedButton(
        onPressed: () => context.read<LoginBloc>().add(LoginSubmitted()),
        child: Text('Login'));
  });
}
