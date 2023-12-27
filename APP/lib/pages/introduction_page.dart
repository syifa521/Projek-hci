import 'package:flutter/material.dart';
import 'package:basomed/pages/introduction_page_2.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

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
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 8),
            Text("ONLINE BOOK BASOMED",
                style: GoogleFonts.irishGrover(fontSize: 20)),
            Image.asset("assets/images/logo_cewe.png"),
            const SizedBox(height: 24),
            Text("Syifa-Nada-Mardhiyyah", style: GoogleFonts.arvo(fontSize: 7)),
            const SizedBox(height: 4),
            Image.asset("assets/images/group-line.png"),
            const SizedBox(height: 12),
            Text("Perpustakaan ini hadir untuk mencerdaskan kehidupan bangsa",
                style: GoogleFonts.aBeeZee(fontSize: 10)),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IntroductionPage2(),
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
                  "Lanjutkan",
                  style: GoogleFonts.aBeeZee(fontSize: 16),
                ))
          ],
        ),
      )),
    );
  }
}
