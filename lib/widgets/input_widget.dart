import 'package:firebase_login_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatefulWidget {
  String name;
  TextEditingController controller;
  bool isPasword = false;
  String errorMessage;
  InputWidget({
    super.key,
    required this.name,
    required this.controller,
    required this.isPasword,
    required this.errorMessage,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPasword ? isObscure : false,
          validator: (value) {
            if (widget.controller.text.isEmpty) {
              return widget.errorMessage;
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: widget.name,
            hintStyle: GoogleFonts.poppins(
                color: Colors.black45, fontWeight: FontWeight.bold),
            suffixIcon: widget.isPasword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: isObscure
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.black45,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.black45,
                          ))
                : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.black45)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Constants.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
