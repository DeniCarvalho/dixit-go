import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.tertiary,
      body: Center(
        child: Text("Login"),
      ),
    );
  }
}
