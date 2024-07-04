import 'package:firebase_login_app/screens/login_screen.dart';
import 'package:firebase_login_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? email;

  String? getUserEmail() {
    String? email = AuthService.auth.currentUser!.email;
    return email;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      email = getUserEmail();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                email!,
                style: GoogleFonts.poppins(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  )),
                  onPressed: () {
                    AuthService.logout();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                  child: Text(
                    "LOGOUT",
                    style: GoogleFonts.poppins(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
