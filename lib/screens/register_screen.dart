import 'package:firebase_login_app/models/user_model.dart';
import 'package:firebase_login_app/screens/login_screen.dart';
import 'package:firebase_login_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button_widget.dart';
import '../widgets/input_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Gap(20),
                        Text(
                          "Create your account!",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(10),
                        Text(
                          "Welcome back you've \n been missed!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black38,
                              fontWeight: FontWeight.w500),
                        ),
                        const Gap(30),
                        InputWidget(
                            name: "Enter username",
                            controller: nameController,
                            isPasword: false,
                            errorMessage: "Enter your email please"),
                        const Gap(10),
                        InputWidget(
                            name: "Enter email",
                            controller: emailController,
                            isPasword: false,
                            errorMessage: "Enter your email please"),
                        const Gap(10),
                        InputWidget(
                            name: "Password",
                            controller: passwordController,
                            isPasword: true,
                            errorMessage: "Enter your password please"),
                        const Gap(10),
                        InputWidget(
                            name: "Confirm password",
                            controller: confirmPasswordController,
                            isPasword: true,
                            errorMessage: "Confirm password please"),
                        const Gap(5),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Recovery password",
                              style: GoogleFonts.poppins(),
                            )),
                        const Gap(20),
                        CustomButtonWidget(
                            name: 'REGISTER',
                            action: () async {
                              if (formKey.currentState!.validate()) {
                                bool isCreate = await AuthService.register(
                                    UserModel(
                                        name: nameController.text.trim(),
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim()));
                                if (isCreate) {
                                  showSuccessAlertDialog(context);
                                } else {
                                  showFailureAlertDialog(context);
                                }
                              }
                            }),
                        const Gap(50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Colors.black38,
                                height: 1,
                              ),
                            ),
                            const Gap(10),
                            Text(
                              "Or continue with",
                              style: GoogleFonts.poppins(),
                            ),
                            const Gap(10),
                            const Expanded(
                              child: Divider(
                                color: Colors.black38,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BorderWidget(path: "assets/google.png"),
                            BorderWidget(path: "assets/apple.png"),
                            BorderWidget(path: "assets/facebook.png"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do you have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.poppins(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSuccessAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content:
              const Text('Connection established successfully. GO to Sign in!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LoginScreen())); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showFailureAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Connection Failed'),
          content: const Text(
              'Could not establish a connection. Please check your network and try again.'),
          actions: [
            TextButton(
              onPressed: () {
                // Logic to retry the connection
                Navigator.of(context).pop();
              },
              child: const Text('Retry'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class BorderWidget extends StatelessWidget {
  final String path;
  const BorderWidget({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Image.asset(
        path,
        height: 40,
      ),
    );
  }
}
