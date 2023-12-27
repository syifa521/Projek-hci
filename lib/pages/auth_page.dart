import 'package:basomed/pages/login_page.dart';
import 'package:basomed/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text("ONLINE BOOK BASOMED",
                style: GoogleFonts.irishGrover(fontSize: 20)),
            const SizedBox(height: 55),
            Image.asset("assets/images/logo-read-book.png"),
            const SizedBox(height: 105),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    maximumSize: Size(MediaQuery.of(context).size.width, 60),
                    minimumSize: Size(MediaQuery.of(context).size.width, 45),
                    backgroundColor: Color(0xFF7963B8)),
                child: Text(
                  "Masuk",
                  style: GoogleFonts.aBeeZee(fontSize: 16),
                )),
            const SizedBox(height: 14),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 48),
                    maximumSize: Size(MediaQuery.of(context).size.width, 60),
                    minimumSize: Size(MediaQuery.of(context).size.width, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    backgroundColor: Color(0xFF7963B8)),
                child: Text(
                  "Daftar",
                  style: GoogleFonts.aBeeZee(fontSize: 16),
                ))
          ],
        ),
      )),
    );
  }
}
