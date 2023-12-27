import 'package:basomed/pages/catatan_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatatanBaruPage extends StatefulWidget {
  const CatatanBaruPage({super.key});

  @override
  State<CatatanBaruPage> createState() => CatatanBaruPageState();
}

class CatatanBaruPageState extends State<CatatanBaruPage> {
  final TextEditingController judulController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 72),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Judul",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        TextFormField(
                          controller: judulController,
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 25.0, horizontal: 10.0),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Judul tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 17),
                        Text(
                          "Deskripsi",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        TextFormField(
                          controller: deskripsiController,
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 25.0, horizontal: 10.0),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Deskripsi tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 72),
                      ],
                    )),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pop(
                                    context,
                                    CatatanModel(
                                        judul: judulController.text,
                                        deskripsi: deskripsiController.text));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 0),
                                maximumSize:
                                    Size(MediaQuery.of(context).size.width, 60),
                                minimumSize:
                                    Size(MediaQuery.of(context).size.width, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                backgroundColor: Color(0xFF442F71)),
                            child: Text(
                              "Simpan",
                              style: GoogleFonts.aBeeZee(fontSize: 16),
                            )))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
