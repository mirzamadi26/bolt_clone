import 'package:flutter/material.dart';
import 'package:rider/utils/app_colors.dart';
import 'package:rider/view/authentication/create_an_account.dart';
import 'package:rider/view/authentication/login_screen.dart';
import 'package:rider/view/authentication/otp_verification.dart';
import 'package:rider/view/authentication/profile_name_screen.dart';
import 'package:rider/view/authentication/welcome_screen.dart';
import 'package:rider/view/drawer%20menu/about_screen.dart';
import 'package:rider/view/drawer%20menu/add_payment_screen.dart';
import 'package:rider/view/drawer%20menu/profile_screen.dart';
import 'package:rider/view/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: const ProfileScreen());
  }
}
