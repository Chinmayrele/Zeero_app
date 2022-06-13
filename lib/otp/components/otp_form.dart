import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:zeero/default_button.dart';
// import 'package:zeero/home/home_screen.dart';
// import 'package:zeero/size_config.dart';

import '../../default_button.dart';
import '../../home/home_screen.dart';
import '../../size_config.dart';

class OtpForm extends StatefulWidget {
  final String verificationId;
  final FirebaseAuth auth;
  const OtpForm({
    Key? key,
    required this.auth,
    required this.verificationId,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  bool isLoading = false;
  TextEditingController otpEditingController = TextEditingController();
  bool hasError = false;
  String currentText = "";
  // FirebaseAuth auth = FirebaseAuth.instance;
  // FocusNode? pin2FocusNode;
  // FocusNode? pin3FocusNode;
  // FocusNode? pin4FocusNode;
  // FocusNode? pin5FocusNode;
  // FocusNode? pin6FocusNode;
  // TextEditingController con1 = TextEditingController();
  // TextEditingController con2 = TextEditingController();
  // TextEditingController con3 = TextEditingController();
  // TextEditingController con4 = TextEditingController();
  // TextEditingController con5 = TextEditingController();
  // TextEditingController con6 = TextEditingController();

  @override
  void initState() {
    super.initState();
    // pin2FocusNode = FocusNode();
    // pin3FocusNode = FocusNode();
    // pin4FocusNode = FocusNode();
    // pin5FocusNode = FocusNode();
    // pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    // pin2FocusNode!.dispose();
    // pin3FocusNode!.dispose();
    // pin4FocusNode!.dispose();
    // pin5FocusNode!.dispose();
    // pin6FocusNode!.dispose();
  }

  bool nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12,
            ),
            child: PinCodeTextField(
              textStyle: const TextStyle(color: Colors.white),
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                borderWidth: 2.5,
                inactiveColor: Colors.white24,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white24,
              ),
              animationDuration: const Duration(milliseconds: 300),
              controller: otpEditingController,
              keyboardType: TextInputType.number,
              onCompleted: (v) {
                debugPrint("Completed");
              },
              onChanged: (value) {
                debugPrint(value);
                setState(() {
                  currentText = value;
                });
              },
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     SizedBox(
          //       width: getProportionateScreenWidth(50),
          //       child: TextFormField(
          //         controller: con1,
          //         autofocus: true,
          //         obscureText: false,
          //         style: const TextStyle(fontSize: 24, color: Colors.white),
          //         keyboardType: TextInputType.number,
          //         textAlign: TextAlign.center,
          //         maxLength: 1,
          //         decoration: otpInputDecoration,
          //         onChanged: (value) {
          //           nextField(value, pin2FocusNode);
          //         },
          //       ),
          //     ),
          //     SizedBox(
          //       width: getProportionateScreenWidth(50),
          //       child: TextFormField(
          //         controller: con2,
          //         focusNode: pin2FocusNode,
          //         obscureText: false,
          //         style: const TextStyle(fontSize: 24, color: Colors.white),
          //         keyboardType: TextInputType.number,
          //         textAlign: TextAlign.center,
          //         maxLength: 1,
          //         decoration: otpInputDecoration,
          //         onChanged: (value) => nextField(value, pin3FocusNode),
          //       ),
          //     ),
          //     SizedBox(
          //       width: getProportionateScreenWidth(50),
          //       child: TextFormField(
          //         controller: con3,
          //         focusNode: pin3FocusNode,
          //         obscureText: false,
          //         style: const TextStyle(fontSize: 24, color: Colors.white),
          //         keyboardType: TextInputType.number,
          //         textAlign: TextAlign.center,
          //         maxLength: 1,
          //         decoration: otpInputDecoration,
          //         onChanged: (value) => nextField(value, pin4FocusNode),
          //       ),
          //     ),
          //     SizedBox(
          //       width: getProportionateScreenWidth(50),
          //       child: TextFormField(
          //         controller: con4,
          //         focusNode: pin4FocusNode,
          //         obscureText: false,
          //         style: const TextStyle(fontSize: 24, color: Colors.white),
          //         keyboardType: TextInputType.number,
          //         textAlign: TextAlign.center,
          //         maxLength: 1,
          //         decoration: otpInputDecoration,
          //         onChanged: (value) => nextField(value, pin5FocusNode),
          //       ),
          //     ),
          //     SizedBox(
          //       width: getProportionateScreenWidth(50),
          //       child: TextFormField(
          //         controller: con5,
          //         focusNode: pin5FocusNode,
          //         obscureText: false,
          //         style: const TextStyle(fontSize: 24, color: Colors.white),
          //         keyboardType: TextInputType.number,
          //         textAlign: TextAlign.center,
          //         maxLength: 1,
          //         decoration: otpInputDecoration,
          //         onChanged: (value) => nextField(value, pin6FocusNode),
          //       ),
          //     ),
          //     SizedBox(
          //       width: getProportionateScreenWidth(50),
          //       child: TextFormField(
          //         controller: con6,
          //         focusNode: pin6FocusNode,
          //         obscureText: false,
          //         style: const TextStyle(fontSize: 24, color: Colors.white),
          //         keyboardType: TextInputType.number,
          //         textAlign: TextAlign.center,
          //         maxLength: 1,
          //         decoration: otpInputDecoration,
          //         onChanged: (value) {
          //           if (value.length == 1) {
          //             pin6FocusNode!.unfocus();
          //             // Then you need to check is the code is correct or not
          //           }
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            press: () async {
              // debugPrint(con6.text);
              PhoneAuthCredential phoneCredential =
                  PhoneAuthProvider.credential(
                verificationId: widget.verificationId,
                smsCode: otpEditingController.text,
              );
              signInWithPhoneCredential(phoneCredential);
              // Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
          )
        ],
      ),
    );
  }

  void signInWithPhoneCredential(PhoneAuthCredential phoneCredential) async {
    setState(() {
      isLoading = true;
    });
    try {
      if (widget.auth.currentUser != null) {}
      final authCredential =
          await widget.auth.signInWithCredential(phoneCredential);
      setState(() {
        isLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      }
    } on FirebaseException catch (e) {
      // snackBar(e.message.toString());
      setState(() {
        isLoading = false;
      });
    }
  }
}
