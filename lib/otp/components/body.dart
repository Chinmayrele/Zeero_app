import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zeero_app/size_config.dart';
// import 'package:zeero/constants.dart';
// import 'package:zeero/size_config.dart';

import '../../constants.dart';
import 'otp_form.dart';

class Body extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;
  final FirebaseAuth auth;
  const Body({
    Key? key,
    required this.phoneNumber,
    required this.auth,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool control = true;

  @override
  Widget build(BuildContext context) {
    final String obscureNumber =
        widget.phoneNumber.replaceRange(0, 7, "******");
    print(obscureNumber);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              Text(
                "We sent your code to $obscureNumber",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(13),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              buildTimer(),
              OtpForm(auth: widget.auth, verificationId: widget.verificationId),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive OTP?",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      setState(() {});
                      // OTP code resend
                    },
                    child: Text(
                      "Resend OTP Code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: getProportionateScreenWidth(15),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "This code will expire in ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(13),
            color: Colors.white,
          ),
        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(13),
            ),
          ),
        ),
      ],
    );
  }
}
