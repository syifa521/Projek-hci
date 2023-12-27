import 'package:flutter/material.dart';
import 'package:basomed/pages/auth_page.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionPage2 extends StatelessWidget {
  const IntroductionPage2({super.key});

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
            Image.asset("assets/images/logo2.png"),
            const SizedBox(height: 24),
            Image.asset("assets/images/city.png"),
            const SizedBox(height: 62),
            Image.asset("assets/images/group-line.png"),
            const SizedBox(height: 12),
            Text(
                "Dengan koleksi buku pelajaran yang bisa kamu akses secara gratis",
                style: GoogleFonts.aBeeZee(fontSize: 10)),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthPage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    backgroundColor: Color(0xFF442F71)),
                child: Text(
                  "Mulai Sekarang",
                  style: GoogleFonts.aBeeZee(fontSize: 16),
                ))
          ],
        ),
      )),
    );
  }
}
