import 'package:flutter/material.dart';
import 'package:grocery_app/provider/bool_provider.dart';
import 'package:provider/provider.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({super.key});

  @override
  State<CustomIconButton> createState() => _CustomIconButton();
}

class _CustomIconButton extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BoolProvider>(
        builder: (context, value, child) => IconButton(
            onPressed: value.hangerFunction,
            icon: value.isTrue
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off)));
  }
}
