import 'package:flutter/material.dart';
import 'package:rider/widgets/textfield_widget.dart';

import '../../utils/app_colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';

class EnterEmailScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  EnterEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enter your email",
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        backgroundColor: Colors.white38,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black54, size: 15),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(
                controllerName: _emailController,
                klabelText: "Email",
              ),
              SizedBox(
                height: 20,
              ),
              textWidget(
                  text: "We'll send you your trip receipts",
                  color: Colors.black54),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.7,
              ),
              ButtonWidget(
                  backgroundColor: AppColors.mainColor,
                  text: "Continue",
                  textColor: Colors.white,
                  function: () {})
            ],
          ),
        ),
      ),
    );
  }
}
