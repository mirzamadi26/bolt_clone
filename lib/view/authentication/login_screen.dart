import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/button_with_icon_widget.dart';
import '../../widgets/phone_field_widget.dart';
import '../../widgets/terms_and_conditions.dart';
import '../../widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textWidget(
                      text: "Enter your Number",
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  const SizedBox(
                    height: 20,
                  ),
                  phone_text_field(),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                      backgroundColor: AppColors.mainColor,
                      text: "Sign in",
                      textColor: Colors.white,
                      function: () {}),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonwithIconWidget(
                      backgroundColor: Colors.white,
                      text: "Sign in with Google",
                      textColor: Colors.black87,
                      function: () {}),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              ),
              terms_and_conditions(),
            ]),
      )),
    ));
  }
}
