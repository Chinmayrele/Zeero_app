import 'package:flutter/material.dart';
import 'package:zeero_app/login/components/login_form.dart';
// import 'package:zeero/login/components/login_form.dart';
// import 'package:zeero/math_utils.dart';

import '../math_utils.dart';
import '../size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
              color: Colors.amber.shade600,
              fontSize: getFontSize(30),
              decoration: TextDecoration.underline),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Image.asset("assets/images/logo.png"),
          const LoginForm(),
        ]),
      ),
    );
  }
}
