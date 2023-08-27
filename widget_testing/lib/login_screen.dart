import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_example_testing/home_screen.dart';
import 'package:login_example_testing/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login', key: Key('login_title'))),
      body: Form(
        key: key,
        child: Column(
          children: [
            TextFormField(
              key: const Key('email_tf'),
              validator: (v) => Validator.validateEmail(v ?? ''),
            ),
            TextFormField(
              key: const Key('password_tf'),
              validator: (v) => Validator.validatePassword(v ?? ''),
            ),
            ElevatedButton(
                key: const Key('login_btn'),
                onPressed: () {
                  if (key.currentState!.validate()) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const HomeScreen()));
                  }
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
