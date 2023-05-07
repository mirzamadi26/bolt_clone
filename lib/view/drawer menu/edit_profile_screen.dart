import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/profile_widget.dart';
import '../../widgets/textfield_widget.dart';

class EditProfileScreen extends StatelessWidget {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        backgroundColor: Colors.white38,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black54, size: 15),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ProfileWidget(
                imagePath: 'assets/profile.jpg',
                isEdit: true,
                onClicked: () async {},
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  controllerName: firstNameController,
                  klabelText: "First Name"),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  controllerName: lastNameController, klabelText: "Last Name"),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  controllerName: phoneController, klabelText: "Phone Number"),
              SizedBox(
                height: 20,
              ),
              ButtonWidget(
                  backgroundColor: AppColors.mainColor,
                  text: "Save",
                  textColor: Colors.white,
                  function: () {})
            ],
          ),
        ),
      ),
    );
  }
}
