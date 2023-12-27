import 'package:basomed/pages/catatan_baru_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatatanPage extends StatefulWidget {
  const CatatanPage({super.key});

  @override
  State<CatatanPage> createState() => CatatanPageState();
}

class CatatanPageState extends State<CatatanPage> {
  List<CatatanModel> catatan = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7963B8),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Catatan Pribadi",
            style: GoogleFonts.abhayaLibre(
                color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
        floatingActionButton: FloatingActionButton.large(
          backgroundColor: Color(0xFF7963B8),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatatanBaruPage(),
                )).then((value) {
              if (value != null && value is CatatanModel) {
                setState(() {
                  catatan.add(value);
                });
              }
            });
          },
          child: Icon(
            Icons.edit_outlined,
            color: Colors.black,
          ),
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: catatan.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(catatan[index].judul),
            subtitle: Text(catatan[index].deskripsi),
          ),
        )));
  }
}

class CatatanModel {
  String judul;
  String deskripsi;

  CatatanModel({required this.judul, required this.deskripsi});
}
