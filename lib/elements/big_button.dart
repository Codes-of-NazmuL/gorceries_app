import 'package:flutter/material.dart';
import 'package:grocery_app/app%20configs/app_Config.dart';
import 'package:grocery_app/services/api_service.dart';
import 'package:provider/provider.dart';

class BigButton extends StatefulWidget {
  final Widget text;
  final Widget? navgateTo;
  final Color? buttonColor;
  final bool? isNavigate;
  final GlobalKey<FormState>? formkey;
  final bool? isLoginApi;
  final bool? isregister;
  final TextEditingController? fname;
  final TextEditingController? lname;
  final TextEditingController? uname;
  final TextEditingController? email;
  final TextEditingController? password;
  const BigButton(
      {super.key,
      this.navgateTo,
      required this.text,
      this.buttonColor,
      this.isNavigate,
      this.formkey,
      this.isLoginApi,
      this.isregister,
      this.email,
      this.fname,
      this.lname,
      this.uname,
      this.password});

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool isl = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiService>(
        builder: (context, api, child) => TextButton(
            onPressed: () async {
              if (widget.formkey == null) {
                widget.navgateTo == null
                    ? null
                    : widget.isNavigate == null
                        ? widget.navgateTo!
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => widget.navgateTo!,
                            ));
              } else {
                if (widget.formkey!.currentState!.validate()) {
                  if (widget.isregister == true) {
                    setState(() {
                      isl = true;
                    });
                    await api.postRegdf(
                        widget.fname!.value.text,
                        widget.lname!.value.text,
                        widget.uname!.value.text,
                        widget.email!.value.text,
                        widget.password!.value.text);
                    if (api.regresp != null) {
                      widget.navgateTo == null
                          ? null
                          : widget.isNavigate == null
                              ? widget.navgateTo!
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => widget.navgateTo!,
                                  ));
                    }
                  } else if (widget.isLoginApi == true) {
                    setState(() {
                      isl = true;
                    });
                    await api.postLogdf(
                        widget.email!.value.text, widget.password!.value.text);
                    if (api.logresp != null) {
                      
                      widget.navgateTo == null
                          ? null
                          : widget.isNavigate == null
                              ? widget.navgateTo!
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => widget.navgateTo!,
                                  ));
                    }
                  } else {
                    widget.navgateTo == null
                        ? null
                        : widget.isNavigate == null
                            ? widget.navgateTo!
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => widget.navgateTo!,
                                ));
                  }
                } else {
                  null;
                }
              }
            },
            child: isl == true
                ? CircularProgressIndicator()
                : Container(
                    height: 65,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: widget.buttonColor == null
                            ? primaryColor
                            : widget.buttonColor!,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: widget.text),
                  )));
  }
}
