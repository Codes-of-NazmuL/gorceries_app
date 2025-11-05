// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/app%20configs/app_Config.dart';
import 'package:grocery_app/elements/big_button.dart';
import 'package:grocery_app/elements/custom_icon_button.dart';
import 'package:grocery_app/provider/bool_provider.dart';
import 'package:grocery_app/screens/registration_screen.dart';
import 'package:grocery_app/screens/select_location_screen.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Consumer<BoolProvider>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        "assets/Images/neccessery_icons/carrot_logo.svg",
                        height: 48,
                        width: 56,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Loging",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Enter your Username and password",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: email,
                                validator: (email) =>
                                    email!.isEmpty ? "Enter your Username" : null,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration:
                                    const InputDecoration(labelText: "Uername"),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: password,
                                validator: (text) => text!.isEmpty
                                    ? "enter a password"
                                    : text.length < 8
                                        ? "password length should getter than 8 digit"
                                        : null,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                obscureText: !value.isTrue,
                                decoration: const InputDecoration(
                                    labelText: "Password",
                                    suffix: CustomIconButton()),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BigButton(
                      navgateTo: SelectLocationScreen(),
                      isNavigate: true,
                      formkey: formKey,
                      isLoginApi: true,
                      email: email,
                      password: password,
                      text: Text(
                        "Log in",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    BigButton(
                        buttonColor: Color(0xff5383EC),
                        text: Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            SvgPicture.asset(
                                "assets/Images/neccessery_icons/google icon.svg"),
                            Spacer(),
                            Text(
                              "Continue with Google",
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Spacer()
                          ],
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegistrationScreen(),
                              ));
                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600),
                            )
                          )
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
