import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButtonWidget extends StatefulWidget {
  String name;
  VoidCallback action;
  CustomButtonWidget({super.key, required this.name, required this.action});

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Constants.primaryColor,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () {
          setState(() {
            isLoad = !isLoad;
          });
          widget.action();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: isLoad
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(widget.name),
        ),
      ),
    );
  }
}
