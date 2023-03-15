import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_notes/auth/auth.dart';
import 'package:smart_notes/spacers/h20_sized_box.dart';
import 'package:smart_notes/components/rounded_button.dart';
import 'package:smart_notes/components/text_input_field.dart';

import '../constants/constants.dart';

class LoginSceen extends StatefulWidget {
  const LoginSceen({Key? key}) : super(key: key);

  @override
  State<LoginSceen> createState() => _LoginSceenState();
}

class _LoginSceenState extends State<LoginSceen> {
  final Auth _auth = Auth();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Log In',
            style: kTitleTextStyle,
          ),
          const H20SizedBox(),
          TextInputField(
            icon: Icons.person,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Enter Your Email',
            obscr: false,
            onChange: (value) {
              email = value;
            },
          ),
          const H20SizedBox(),
          TextInputField(
            icon: Icons.password_rounded,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Enter Your Password',
            obscr: true,
            onChange: (value) {
              password = value;
            },
          ),
          const H20SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: RoundedButton(
                  onPressed: () async {
                    _auth.signIn(email, password, context);
                  },
                  buttonText: 'Log In',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    const Text(
                      'If you are new, ',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'Register from here',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
