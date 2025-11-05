// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/elements/big_button.dart';
import 'package:grocery_app/screens/log_in_srceen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/Images/neccessery_icons/secound_screen_bg.png",
              ),
              fit: BoxFit.fitHeight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            SizedBox(
              height: screensize.height - (screensize.height / 2),
            ),
            SvgPicture.asset(
              "assets/Images/neccessery_icons/carrot_logo.svg",
              color: Colors.white,
              height: 56,
              width: 48,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Welcome\nto our store",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "Ger your groceries in as fast as one hour",
              style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.w100,
                  fontSize: 12),
            )),
            SizedBox(
              height: 30,
            ),
            BigButton(
              navgateTo: LogInScreen(),
              isNavigate: true,
              text: Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
