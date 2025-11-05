import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/app%20configs/app_Config.dart';
import 'package:grocery_app/elements/big_button.dart';
import 'package:grocery_app/elements/custom_icon_button.dart';
import 'package:grocery_app/provider/bool_provider.dart';
import 'package:grocery_app/screens/log_in_srceen.dart';
import 'package:grocery_app/screens/select_location_screen.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final first_name = TextEditingController();
    final last_name = TextEditingController();
    final name = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();
    final fromkey = GlobalKey<FormState>();
    return Scaffold(
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
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Enter your credentials to continue",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                key: fromkey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: first_name,
                              validator: (fname) => fname!.isEmpty
                                  ? "Enter your First Name"
                                  : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                  labelText: "First Name"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: last_name,
                              validator: (lname) => lname!.isEmpty
                                  ? "Enter your Last Name"
                                  : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration:
                                  const InputDecoration(labelText: "Last Name"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: name,
                        validator: (name) =>
                            name!.isEmpty ? "Enter your Username" : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration:
                            const InputDecoration(labelText: "Username"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: email,
                        validator: (email) =>
                            email!.isEmpty ? "Enter your Email" : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(labelText: "Email"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Consumer<BoolProvider>(
                          builder: (context, value, child) => TextFormField(
                            controller: password,
                            validator: (text) => text!.isEmpty
                                ? "enter a password"
                                : text.length < 8
                                    ? "password length should getter than 6 digit"
                                    : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: !value.isTrue,
                            decoration: const InputDecoration(
                                labelText: "Password",
                                suffix: CustomIconButton()),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "By continuing you agree to our",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Terms of Service",
                  style: TextStyle(color: primaryColor, fontSize: 12),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "and",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  " Privacy Policy.",
                  style: TextStyle(color: primaryColor, fontSize: 12),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BigButton(
              navgateTo: SelectLocationScreen(),
              isNavigate: true,
              formkey: fromkey,
              isregister: true,
              fname: first_name,
              lname: last_name,
              uname: name,
              email: email,
              password: password,
              text: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LogInScreen(),
                      ));
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.w600),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
