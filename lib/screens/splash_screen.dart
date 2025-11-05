import 'package:flutter/material.dart';
import 'package:grocery_app/app%20configs/app_Config.dart';
import 'dart:async' as asyn;
import 'package:grocery_app/screens/onboarding_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    asyn.Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnboardingScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
            child: SvgPicture.asset(
                "assets/Images/product_images/main_logo.svg")));
  }
}
