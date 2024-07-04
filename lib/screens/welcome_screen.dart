import 'package:firebase_login_app/constants.dart';
import 'package:firebase_login_app/screens/login_screen.dart';
import 'package:firebase_login_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: Constants.getScreenWidth(context),
        height: Constants.getScreenHeigth(context),
        color: Constants.bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: Constants.getScreenHeigth(context) * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Constants.containerColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Image.asset("assets/welcome.png"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Discover your Dream \n job here.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            Text(
                "Explore all the most exciting roles\n based in your internet And study major",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: Text(
                        "REGISTER",
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.bgColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.white)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: Text(
                        "SIGN IN",
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
