import 'package:basomed/pages/kategory_buku_tabs_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KategoriBukuPage extends StatefulWidget {
  const KategoriBukuPage({super.key});

  @override
  State<KategoriBukuPage> createState() => KategoriBukuPageState();
}

class KategoriBukuPageState extends State<KategoriBukuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Color(0xFFD9D9D9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Kategory Buku",
                  style: GoogleFonts.abhayaLibre(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const Divider(color: Colors.black, height: 1, thickness: 1),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
        Container(
          height: 230,
          margin: const EdgeInsets.symmetric(vertical: 72, horizontal: 36),
          decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KategoriBukuTabsPage(
                            tab: 0,
                          ),
                        ));
                  },
                  child: AbsorbPointer(
                    child: Center(
                      child: Text(
                        "IPA",
                        style: GoogleFonts.abhayaLibre(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.black, height: 1, thickness: 1),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KategoriBukuTabsPage(tab: 1),
                        ));
                  },
                  child: AbsorbPointer(
                    child: Center(
                      child: Text(
                        "IPS",
                        style: GoogleFonts.abhayaLibre(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
