import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BukuDisimpanPage extends StatefulWidget {
  const BukuDisimpanPage({super.key});

  @override
  State<BukuDisimpanPage> createState() => BukuDisimpanPageState();
}

class BukuDisimpanPageState extends State<BukuDisimpanPage> {
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
                  "Buku Yang Disimpan",
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
          margin: const EdgeInsets.symmetric(vertical: 72, horizontal: 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                color: Color(0xFFD9D9D9),
                child: Center(
                  child: Text(
                    "Susunan Rak",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  color: Color(0xFF7963B8),
                  child: Text("Pinjaman Buku",
                      style: GoogleFonts.abhayaLibre(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ),
              const Divider(color: Colors.white, height: 1, thickness: 1),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  color: Color(0xFF7963B8),
                  child: Text("Riwayat Pinjaman",
                      style: GoogleFonts.abhayaLibre(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
