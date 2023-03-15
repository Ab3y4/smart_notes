import 'package:flutter/material.dart';
import 'package:smart_notes/auth/auth.dart';
import 'package:smart_notes/spacers/h20_sized_box.dart';

import '../components/rounded_button.dart';
import '../components/text_input_field.dart';
import '../constants/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            'Register',
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
                    _auth.signUp(email, password, context);
                  },
                  buttonText: 'Register',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
